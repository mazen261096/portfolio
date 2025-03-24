import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/portfolio_model.dart';

class SupabasePortfolioService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<PortfolioModel> getPortfolio(String userId) async {
    final response = await supabase
        .from('users')
        .select('*, personal_info(*), contact_info(*), experience(*), projects(*)')
        .eq('id', userId)
        .single();
    return PortfolioModel.fromJson(response);
  }

  Future<void> updatePersonalInfo(Map<String, dynamic> data) async {
    await supabase.from('personal_info').update(data).eq('user_id', data['user_id']);
  }

  Future<void> addContactInfo(Map<String, dynamic> data) async {
    await supabase.from('contact_info').insert(data);
  }

  Future<void> deleteContactInfo(String contactId) async {
    await supabase.from('contact_info').delete().eq('id', contactId);
  }

  Future<void> addExperience(Map<String, dynamic> data) async {
    await supabase.from('experience').insert(data);
  }

  Future<void> deleteExperience(String experienceId) async {
    await supabase.from('experience').delete().eq('id', experienceId);
  }

  Future<void> addProject(Map<String, dynamic> data) async {
    await supabase.from('projects').insert(data);
  }

  Future<void> deleteProject(String projectId) async {
    await supabase.from('projects').delete().eq('id', projectId);
  }
}
