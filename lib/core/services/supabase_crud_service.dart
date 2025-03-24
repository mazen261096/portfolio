import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCRUDService {
  final SupabaseClient supabase = Supabase.instance.client;

  /// ✅ Insert a new record into a table
  Future<void> insert({
    required String tableName,
    required Map<String, dynamic> data,
  }) async {
    try {
      await supabase.from(tableName).insert(data);
      print("Data inserted into $tableName successfully.");
    } catch (error) {
      throw Exception("Error inserting data into $tableName: $error");
    }
  }

  /// ✅ Fetch records from a table with optional filters
  Future<List<Map<String, dynamic>>> fetch({
    required String tableName,
    Map<String, dynamic>? filters, // Optional filters
  }) async {
    try {
      var query = supabase.from(tableName).select();

      // Apply filters if provided
      if (filters != null) {
        filters.forEach((key, value) {
          query = query.eq(key, value);
        });
      }

      final response = await query;
      return List<Map<String, dynamic>>.from(response);
    } catch (error) {
      throw Exception("Error fetching data from $tableName: $error");
    }
  }

  /// ✅ Update a record in a table
  Future<void> update({
    required String tableName,
    required Map<String, dynamic> updatedData,
    required String columnKey,
    required dynamic columnValue,
  }) async {
    try {
      await supabase.from(tableName).update(updatedData).eq(columnKey, columnValue);
      print("Data updated in $tableName successfully.");
    } catch (error) {
      throw Exception("Error updating data in $tableName: $error");
    }
  }

  /// ✅ Delete a record from a table
  Future<void> delete({
    required String tableName,
    required String columnKey,
    required dynamic columnValue,
  }) async {
    try {
      await supabase.from(tableName).delete().eq(columnKey, columnValue);
      print("Data deleted from $tableName successfully.");
    } catch (error) {
      throw Exception("Error deleting data from $tableName: $error");
    }
  }
}
