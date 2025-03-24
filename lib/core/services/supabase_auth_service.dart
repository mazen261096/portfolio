import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:portfolio/core/services/supabase_crud_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  final SupabaseClient supabase = Supabase.instance.client;
  final SupabaseCRUDService supabaseCRUDService = SupabaseCRUDService();

  Future<Map<String, dynamic>> registerUser({
    required String email,
    required String password,
    required String userName,
  }) async {
    // 🔹 First, register with Supabase Auth
    final authResponse =
        await supabase.auth.signUp(email: email, password: password);

    if (authResponse.user == null) {
      throw Exception("User registration failed.");
    }

    // 🔹 Then, insert into `users` table via RPC
    final response = await supabase.rpc('register_new_user', params: {
      '_email': email,
      '_user_name': userName,
      '_user_id': authResponse.user!.id,
    });

    if (response == null || response.isEmpty) {
      throw Exception("User registration failed at database level.");
    }

    return response as Map<String, dynamic>; // Return complete user row
  }

  Future<bool> isUsernameAvailable({required String userName}) async {
    final response = await supabase
        .rpc('is_username_taken', params: {'_user_name': userName});

    return response as bool; // True if username is taken, False if available
  }

  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    // 🔹 Authenticate user with Supabase Auth
    final authResponse = await supabase.auth
        .signInWithPassword(email: email, password: password);

    if (authResponse.user == null) {
      throw Exception("Invalid email or password.");
    }

    // 🔹 Fetch user details from the database
    final List response = await supabaseCRUDService.fetch(
        tableName: 'users',
        filters: {
          'id': authResponse.user!.id
        } // Ensure correct key-value format
        );
    if (response == null || response.isEmpty) {
      throw Exception("User data not found in database.");
    }

    return response.first as Map<String, dynamic>;
  }

  Future<void> deleteAccount() async {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;

    if (user == null) {
      print("No user is logged in.");
      return;
    }

    print('Your access token: ${supabase.auth.currentSession!.accessToken}');

    try {
      final response = await supabase.functions.invoke(
        'delete-user',
        body: {},
        headers: {
          "Content-Type": "application/json",
        },
      );

      // Check if the response contains an error
    } catch (e) {
      print("Error deleting account: $e");
    }
  }



  Future<void> deleteUser() async {
    final url = 'https://vjkzigqgootdjxrwreya.supabase.co/functions/v1/hello-world';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${supabase.auth.currentSession!.accessToken}',
          'Content-Type': 'application/json',
        },
        body: json.encode({'id': supabase.auth.currentUser!.id}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Success: ${data['message']}');
      } else {
        final errorData = json.decode(response.body);
        print('Error: ${errorData['error']}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }





  //mazen261096@gmail.com
}

//eyJhbGciOiJIUzI1NiIsImtpZCI6IjhVZ0J0Mm5GWXc1cG90bmgiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3Zqa3ppZ3Fnb290ZGp4cndyZXlhLnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiJjNjc1NjZmOC0yOTMxLTRmMGItODI1Zi1mYTY1OWE4MDNmN2IiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzQxODM3MDczLCJpYXQiOjE3NDE4MzM0NzMsImVtYWlsIjoibWF6ZW4yNjEwOTZAZ21haWwuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJlbWFpbCI6Im1hemVuMjYxMDk2QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJwaG9uZV92ZXJpZmllZCI6ZmFsc2UsInN1YiI6ImM2NzU2NmY4LTI5MzEtNGYwYi04MjVmLWZhNjU5YTgwM2Y3YiJ9LCJyb2xlIjoiYXV0aGVudGljYXRlZCIsImFhbCI6ImFhbDEiLCJhbXIiOlt7Im1ldGhvZCI6InBhc3N3b3JkIiwidGltZXN0YW1wIjoxNzQxODMzNDczfV0sInNlc3Npb25faWQiOiJhZDMxMzgwNS1hZjQ4LTQ1OTgtYTc3MS1mN2E4NDUyYjcwZjgiLCJpc19hbm9ueW1vdXMiOmZhbHNlfQ.r0sw7QKSfPtDd_Ne8EBIsOwhQrYH3VEehrlP3yQMHRg
