import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/contact_info_model.dart';
import '../models/experience_model.dart';
import '../models/personal_info_model.dart';
import '../models/project_model.dart';

class PortfolioDataSource {
  final FirebaseFirestore firestore;

  PortfolioDataSource(this.firestore);

  Future<Map<String, dynamic>> getPortfolioData() async {
    final snapshot = await firestore.collection('portfolio').doc('1').get();
    return snapshot.data() ?? {};
  }

  Future<void> addOrUpdatePersonalInfo(PersonalInfoModel personalInfo) async {
    await firestore.collection('portfolio').doc('1').set({
      'personalInfo': personalInfo.toJson(),
    }, SetOptions(merge: true));
  }

  Future<void> deletePersonalInfo() async {
    await firestore.collection('portfolio').doc('1').update({
      'personalInfo': FieldValue.delete(),
    });
  }

  Future<void> addOrUpdateContactInfo(ContactInfoModel contactInfo) async {
    await firestore.collection('portfolio').doc('1').set({
      'contactInfo.${contactInfo.id}': contactInfo.toJson(),
    }, SetOptions(merge: true));
  }

  Future<void> deleteContactInfo(String contactId) async {
    await firestore.collection('portfolio').doc('1').update({
      'contactInfo.$contactId': FieldValue.delete(),
    });
  }

  Future<void> addOrUpdateExperience(ExperienceModel experience) async {
    await firestore.collection('portfolio').doc('1').set({
      'experience.${experience.id}': experience.toJson(),
    }, SetOptions(merge: true));
  }

  Future<void> deleteExperience(String experienceId) async {
    await firestore.collection('portfolio').doc('1').update({
      'experience.$experienceId': FieldValue.delete(),
    });
  }

  Future<void> addOrUpdateProject(ProjectModel project) async {
    await firestore.collection('portfolio').doc('1').set({
      'projects.${project.id}': project.toJson(),
    }, SetOptions(merge: true));
  }

  Future<void> deleteProject(String projectId) async {
    await firestore.collection('portfolio').doc('1').update({
      'projects.$projectId': FieldValue.delete(),
    });
  }
}
