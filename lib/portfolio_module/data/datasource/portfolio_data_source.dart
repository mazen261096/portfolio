import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseDataSource {
  Future<Map<String, dynamic>> getPortfolioData({required String userId});
  Future<void> addOrUpdatePersonalInfo({required Map<String, dynamic> data});
  Future<void> deletePersonalInfo({required String userId});
  Future<void> addOrUpdateContactInfo({required Map<String, dynamic> data});
  Future<void> deleteContactInfo({required String contactId});
  Future<void> addOrUpdateExperience({required Map<String, dynamic> data});
  Future<void> deleteExperience({required String experienceId});
  Future<void> addOrUpdateProject({required Map<String, dynamic> data});
  Future<void> deleteProject({required String projectId});
}


class SupabaseDataSource implements BaseDataSource {
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  Future<Map<String, dynamic>> getPortfolioData({required String userId}) async {
    try {
      final response = await supabase
          .from('users')
          .select('*, personal_info(*), contact_info(*), experience(*), projects(*)')
          .eq('id', userId)
          .single();

      if (response == null) throw Exception("No portfolio data found.");
      return response;
    } catch (e) {
      throw Exception("Error fetching portfolio: ${e.toString()}");
    }
  }

  @override
  Future<void> addOrUpdatePersonalInfo({required Map<String, dynamic> data}) async {
    try {
      await supabase.from('personal_info').upsert(data);
    } catch (e) {
      throw Exception("Error updating personal info: ${e.toString()}");
    }
  }

  @override
  Future<void> deletePersonalInfo({required String userId}) async {
    try {
      await supabase.from('personal_info').delete().eq('user_id', userId);
    } catch (e) {
      throw Exception("Error deleting personal info: ${e.toString()}");
    }
  }

  @override
  Future<void> addOrUpdateContactInfo({required Map<String, dynamic> data}) async {
    try {
      await supabase.from('contact_info').upsert(data);
    } catch (e) {
      throw Exception("Error adding/updating contact info: ${e.toString()}");
    }
  }

  @override
  Future<void> deleteContactInfo({required String contactId}) async {
    try {
      await supabase.from('contact_info').delete().eq('id', contactId);
    } catch (e) {
      throw Exception("Error deleting contact info: ${e.toString()}");
    }
  }

  @override
  Future<void> addOrUpdateExperience({required Map<String, dynamic> data}) async {
    try {
      await supabase.from('experience').upsert(data);
    } catch (e) {
      throw Exception("Error adding/updating experience: ${e.toString()}");
    }
  }

  @override
  Future<void> deleteExperience({required String experienceId}) async {
    try {
      await supabase.from('experience').delete().eq('id', experienceId);
    } catch (e) {
      throw Exception("Error deleting experience: ${e.toString()}");
    }
  }

  @override
  Future<void> addOrUpdateProject({required Map<String, dynamic> data}) async {
    try {
      await supabase.from('projects').upsert(data);
    } catch (e) {
      throw Exception("Error adding/updating project: ${e.toString()}");
    }
  }

  @override
  Future<void> deleteProject({required String projectId}) async {
    try {
      await supabase.from('projects').delete().eq('id', projectId);
    } catch (e) {
      throw Exception("Error deleting project: ${e.toString()}");
    }
  }
}
