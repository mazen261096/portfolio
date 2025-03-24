import 'package:uuid/uuid.dart';
import 'package:portfolio/portfolio_module/data/models/contact_info_model.dart';
import 'package:portfolio/portfolio_module/data/models/experience_model.dart';
import 'package:portfolio/portfolio_module/data/models/personal_info_model.dart';
import 'package:portfolio/portfolio_module/data/models/project_model.dart';
import 'package:portfolio/portfolio_module/data/models/portfolio_model.dart';

final uuid = Uuid();

/// **Dummy ContactInfo List**
List<ContactInfoModel> dummyContactInfo = [
  ContactInfoModel(
    id: uuid.v4(),
    name: "LinkedIn",
    logoUrl: "https://example.com/linkedin_logo.png",
    linkOrPhone: "https://linkedin.com/in/dummyprofile",
  ),
  ContactInfoModel(
    id: uuid.v4(),
    name: "GitHub",
    logoUrl: "https://example.com/github_logo.png",
    linkOrPhone: "https://github.com/dummyuser",
  ),
  ContactInfoModel(
    id: uuid.v4(),
    name: "Phone",
    logoUrl: "https://example.com/phone_logo.png",
    linkOrPhone: "+123456789",
  ),
];

/// **Dummy Experience List**
List<ExperienceModel> dummyExperience = [
  ExperienceModel(
    id: uuid.v4(),
    companyName: "Google",
    logoUrl: "https://example.com/google_logo.png",
    role: "Software Engineer",
    description: "Worked on scalable backend systems and cloud solutions.",
    startDate: DateTime(2021, 5, 10),
    endDate: DateTime(2023, 1, 20),
  ),
  ExperienceModel(
    id: uuid.v4(),
    companyName: "Microsoft",
    logoUrl: "https://example.com/microsoft_logo.png",
    role: "Frontend Developer",
    description: "Developed user-friendly interfaces for enterprise applications.",
    startDate: DateTime(2019, 8, 15),
    endDate: DateTime(2021, 4, 5),
  ),
];

/// **Dummy Personal Info**
PersonalInfoModel dummyPersonalInfo = PersonalInfoModel(
  name: "John Doe",
  profession: "Full Stack Developer",
  profileImage: "https://example.com/profile_image.png",
);

/// **Dummy Projects List**
List<ProjectModel> dummyProjects = [
  ProjectModel(
    id: uuid.v4(),
    name: "E-Commerce App",
    description: "An online shopping platform with real-time payment integration.",
    technologies: ["Flutter", "Firebase", "Stripe"],
    links: ["https://github.com/dummyuser/ecommerce-app"],
    images: ["https://example.com/ecommerce_screenshot.png"],
  ),
  ProjectModel(
    id: uuid.v4(),
    name: "Chat Application",
    description: "A secure and scalable chat application with encryption.",
    technologies: ["Node.js", "Socket.io", "MongoDB"],
    links: ["https://github.com/dummyuser/chat-app"],
    images: ["https://example.com/chatapp_screenshot.png"],
  ),
];

/// **Dummy Portfolio Object**
PortfolioModel dummyPortfolio = PortfolioModel(
  contactInfo: dummyContactInfo,
  experience: dummyExperience,
  personalInfo: dummyPersonalInfo,
  projects: dummyProjects,
);
