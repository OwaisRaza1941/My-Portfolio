/// All user-facing copy for the home screen, kept in one place so content can
/// be edited or localized without touching widget code.
class AppStrings {
  AppStrings._();

  // ===========================
  // Brand
  // ===========================

  static const String logo = '<Owais>';
  static const String fullName = 'Owais Raza';
  static const String initials = 'OR';

  // ===========================
  // Navigation
  // ===========================

  static const String navHome = 'Home';
  static const String navAbout = 'About';
  static const String navServices = 'Services';
  static const String navSkills = 'Skills';
  static const String navProjects = 'Projects';
  static const String navContact = 'Contact';

  // ===========================
  // Call To Action
  // ===========================

  static const String hireMe = 'Hire Me';
  static const String downloadCv = 'Download CV';

  // ===========================
  // Hero
  // ===========================

  static const String heroBadge = 'Flutter Developer';
  static const String heroGreeting = "Hi, I'm";
  static const String heroRoleLine = 'Flutter Developer';
  static const String heroHeadline = 'Modern Mobile &\nWeb Developer';
  static const String heroDescription =
      'I craft premium, high-performance mobile and web experiences with '
      'Flutter — blending clean architecture, elegant UI, and smooth motion '
      'to turn ideas into production-grade products.';

  // ===========================
  // Availability
  // ===========================

  static const String availability = 'Available for work';

  // ===========================
  // About — Header
  // ===========================

  static const String aboutBadgeEmoji = '👋';
  static const String aboutBadge = 'About Me';
  static const String aboutTitle = 'Who I Am & What I Do';
  static const String aboutSubtitle =
      'A passionate Flutter Developer focused on building modern, scalable '
      'and high-performance applications.';

  // ===========================
  // About — Right Column
  // ===========================

  static const String aboutHeadline =
      'Turning ideas into polished,\nproduction-ready products';

  static const String aboutParagraphOne =
      "I'm Owais Raza, a Flutter developer who cares as much about how a "
      'product is built as how it looks. I design and ship cross-platform '
      'apps for mobile and web from a single, well-structured codebase.';

  static const String aboutParagraphTwo =
      'My work leans on clean architecture, reusable widgets, and a strict '
      'design system — so features stay easy to extend, the UI stays '
      'consistent, and the app stays fast as it grows.';

  // ===========================
  // About — Highlights
  // ===========================

  static const String aboutHighlightArchitectureTitle = 'Clean Architecture';
  static const String aboutHighlightArchitectureBody =
      'Layered, testable code that scales with the product.';

  static const String aboutHighlightUiTitle = 'Pixel-Perfect UI';
  static const String aboutHighlightUiBody =
      'Designs rebuilt faithfully, down to spacing and motion.';

  static const String aboutHighlightCrossPlatformTitle = 'Cross-Platform';
  static const String aboutHighlightCrossPlatformBody =
      'Android, iOS, and web shipped from one codebase.';

  static const String aboutHighlightPerformanceTitle = 'Performance First';
  static const String aboutHighlightPerformanceBody =
      'Smooth 60fps motion and lean, efficient rebuilds.';

  // ===========================
  // About — Stats
  // ===========================

  static const String aboutStatExperienceValue = '2+';
  static const String aboutStatExperienceLabel = 'Years Experience';

  static const String aboutStatProjectsValue = '15+';
  static const String aboutStatProjectsLabel = 'Projects Built';

  static const String aboutStatCommitmentValue = '100%';
  static const String aboutStatCommitmentLabel = 'Commitment';

  // ===========================
  // About — Illustration
  // ===========================

  /// Filename shown in the code window's title bar.
  static const String aboutCodeFileName = 'about_me.dart';

  static const String aboutTechFlutter = 'Flutter';
  static const String aboutTechDart = 'Dart';
  static const String aboutTechFirebase = 'Firebase';

  // ===========================
  // About — Actions
  // ===========================

  static const String aboutViewProjects = 'View Projects';

  // ===========================
  // Services — Header
  // ===========================

  static const String servicesBadgeEmoji = '🛠️';
  static const String servicesBadge = 'What I Do';
  static const String servicesTitle = 'Services I Offer';
  static const String servicesSubtitle =
      'End-to-end Flutter development — from a Figma file to a signed build '
      'on the Play Store, backed by clean architecture and a real design '
      'system.';

  // ===========================
  // Services — Cards
  // ===========================

  static const String serviceMobileTitle = 'Mobile Apps';
  static const String serviceMobileBody =
      'Android and iOS apps built with Flutter — modern UI, Firebase behind '
      'it, and performance tuned for real devices.';
  static const List<String> serviceMobileFeatures = [
    'Android & iOS from one codebase',
    'Firebase-backed features',
    'Play Store & App Store release',
  ];

  static const String serviceWebTitle = 'Responsive Websites';
  static const String serviceWebBody =
      'Fast, responsive websites that hold their layout on every screen, '
      'from a 320pt phone to an ultra-wide monitor.';
  static const List<String> serviceWebFeatures = [
    'Mobile-first responsive layouts',
    'Flutter Web & hosting setup',
    'Fast loads and smooth scrolling',
  ];

  static const String serviceCrossPlatformTitle = 'Cross-Platform Apps';
  static const String serviceCrossPlatformBody =
      'One codebase shipped to Android, iOS, Web, Windows, macOS and Linux — '
      'with platform-aware behaviour where it matters.';
  static const List<String> serviceCrossPlatformFeatures = [
    'Single shared codebase',
    'Adaptive, platform-aware UI',
    'Lower cost, faster delivery',
  ];

  static const String serviceUiUxTitle = 'UI/UX Development';
  static const String serviceUiUxBody =
      'Pixel-perfect Flutter interfaces rebuilt straight from your Figma '
      'file, down to the spacing and the motion.';
  static const List<String> serviceUiUxFeatures = [
    'Figma to Flutter, faithfully',
    'Reusable widgets & design system',
    'Smooth, purposeful animations',
  ];

  static const String serviceFirebaseTitle = 'Firebase Integration';
  static const String serviceFirebaseBody =
      'Authentication, Firestore, notifications, storage and analytics wired '
      'end to end with sensible security rules.';
  static const List<String> serviceFirebaseFeatures = [
    'Auth, Firestore & Realtime DB',
    'Push notifications & Storage',
    'Analytics, Crashlytics & rules',
  ];

  static const String serviceApiTitle = 'API Integration';
  static const String serviceApiBody =
      'REST API integration on a secure, scalable service layer that stays '
      'easy to extend as the backend grows.';
  static const List<String> serviceApiFeatures = [
    'REST endpoints & JSON parsing',
    'Secure token & session handling',
    'Clean, testable service layer',
  ];

  // ===========================
  // Services — Call To Action
  // ===========================

  static const String servicesCtaTitle = 'Have a project in mind?';
  static const String servicesCtaBody =
      "Tell me what you're building and I'll come back with a plan, a "
      'timeline, and an honest estimate.';
  static const String servicesCtaAction = "Let's Work Together";

  // ===========================
  // Skills — Header
  // ===========================

  static const String skillsBadgeEmoji = '⚡';
  static const String skillsBadge = 'My Skills';
  static const String skillsTitle = 'Technologies I Work With';
  static const String skillsSubtitle =
      'The tools, frameworks and practices I use every day to design, build '
      'and ship production-grade Flutter apps.';

  // ===========================
  // Skills — Categories
  // ===========================

  static const String skillsLanguagesTitle = 'Languages & Frameworks';
  static const List<String> skillsLanguages = [
    'Dart',
    'Flutter Mobile',
    'Flutter Web',
  ];

  static const String skillsMobileTitle = 'Mobile App Development';
  static const List<String> skillsMobile = [
    'Android & iOS Development',
    'Responsive UI Design',
    'Material Design',
    'Custom Widgets',
    'UI/UX Implementation',
    'Flutter Animations',
  ];

  static const String skillsStateTitle = 'State Management';
  static const List<String> skillsState = [
    'GetX (Advanced)',
    'Provider (Familiarity)',
  ];

  static const String skillsDatabaseTitle = 'Database & Storage';
  static const List<String> skillsDatabase = [
    'Firebase Firestore',
    'Firebase Realtime Database',
    'Firebase Authentication',
    'Advanced Firebase Features',
    'SQLite Database',
    'Local Storage',
    'Shared Preferences',
    'File Handling',
    'Offline Data Persistence',
  ];

  static const String skillsApiTitle = 'API & Backend Integration';
  static const List<String> skillsApi = [
    'REST API Integration',
    'JSON Parsing',
    'HTTP Requests',
  ];

  static const String skillsPerformanceTitle = 'Performance & Optimization';
  static const List<String> skillsPerformance = [
    'App Architecture (MVC / MVVM)',
    'Code Refactoring',
    'Debugging',
    'Performance Tuning',
  ];

  static const String skillsToolsTitle = 'Tools & Platforms';
  static const List<String> skillsTools = [
    'Android Studio',
    'Visual Studio Code',
    'Git & GitHub',
    'Emulator & Device Testing',
  ];

  static const String skillsDeploymentTitle = 'App Store & Play Store Deploy';
  static const List<String> skillsDeployment = [
    'Play Store Deployment',
    'App Store Deployment',
    'Release Builds & App Signing',
    'Versioning & Store Listing',
  ];

  // ===========================
  // Projects — Header
  // ===========================

  static const String projectsBadgeEmoji = '💼';
  static const String projectsBadge = 'My Work';
  static const String projectsTitle = 'Featured Projects';
  static const String projectsSubtitle =
      'A selection of Flutter apps I designed and shipped end to end — real '
      'screens, real state management, real backends behind them.';

  // ===========================
  // Projects — Actions
  // ===========================

  static const String projectViewCode = 'View Code';
  static const String projectLiveDemo = 'Live Demo';
  static const String projectsFooterTitle = 'More on GitHub';
  static const String projectsFooterBody =
      'These are the highlights — the rest of my Flutter work, experiments and '
      'UI clones live in the repositories.';
  static const String projectsFooterAction = 'Browse All Projects';

  // ===========================
  // Projects — Cards
  // ===========================

  static const String projectSwiftCartTitle = 'SwiftCart';
  static const String projectSwiftCartCategory = 'E-Commerce';
  static const String projectSwiftCartBody =
      'A full shopping app — product catalog, cart, checkout and order history '
      'wired to Firebase, with a reactive GetX layer keeping the UI in sync.';
  static const List<String> projectSwiftCartFeatures = [
    'Product catalog with search & filters',
    'Cart, checkout and order history',
    'Firebase auth and secure user data',
  ];
  static const List<String> projectSwiftCartTech = [
    'Flutter',
    'GetX',
    'Firebase',
    'Firestore',
  ];

  static const String projectChatTitle = 'Realtime Chat App';
  static const String projectChatCategory = 'Messaging';
  static const String projectChatBody =
      'A one-to-one messaging app with realtime delivery, presence and image '
      'sharing, built on Firestore streams so every screen updates instantly.';
  static const List<String> projectChatFeatures = [
    'Realtime one-to-one messaging',
    'Online presence & read receipts',
    'Image sharing via Firebase Storage',
  ];
  static const List<String> projectChatTech = [
    'Flutter',
    'Firestore',
    'Firebase Auth',
    'Storage',
  ];

  static const String projectFoodTitle = 'Food Delivery App';
  static const String projectFoodCategory = 'Food & Delivery';
  static const String projectFoodBody =
      'A restaurant ordering experience with categorized menus, a live cart '
      'and order tracking — animated, image-heavy screens kept at 60fps.';
  static const List<String> projectFoodFeatures = [
    'Categorized menu & restaurant browsing',
    'Live cart with quantity and totals',
    'Order placement and status tracking',
  ];
  static const List<String> projectFoodTech = [
    'Flutter',
    'GetX',
    'REST API',
    'Firebase',
  ];

  static const String projectTaskTitle = 'Task Manager';
  static const String projectTaskCategory = 'Productivity';
  static const String projectTaskBody =
      'A daily planner with projects, priorities and reminders, backed by '
      'local storage so the whole board stays usable completely offline.';
  static const List<String> projectTaskFeatures = [
    'Projects, priorities and due dates',
    'Local reminders & notifications',
    'Offline-first SQLite persistence',
  ];
  static const List<String> projectTaskTech = [
    'Flutter',
    'SQLite',
    'Provider',
    'Notifications',
  ];

  // ===========================
  // Contact — Header
  // ===========================

  static const String contactBadgeEmoji = '📬';
  static const String contactBadge = 'Get In Touch';
  static const String contactTitle = "Let's Build Something Together";
  static const String contactSubtitle =
      'Have a project, a role, or just a question? Send it over and I\'ll get '
      'back to you with a plan and an honest timeline.';

  // ===========================
  // Contact — Info Column
  // ===========================

  static const String contactInfoHeadline = 'Contact Information';
  static const String contactInfoBody =
      'The fastest way to reach me is email — the form beside this opens it '
      'pre-filled, or you can write directly.';

  static const String contactEmailLabel = 'Email';
  static const String contactEmailValue = 'owaisraza55670@gmail.com';

  static const String contactLocationLabel = 'Location';
  static const String contactLocationValue = 'Pakistan · Remote Worldwide';

  static const String contactResponseLabel = 'Response Time';
  static const String contactResponseValue = 'Usually within 24 hours';

  static const String contactFreelanceLabel = 'Freelance';
  static const String contactFreelanceValue = 'Open to new projects';

  /// Small heading above the social icon row in the info column.
  static const String contactFollowLabel = 'Find me online';

  // ===========================
  // Contact — Form
  // ===========================

  static const String contactFormTitle = 'Send a Message';

  static const String contactNameLabel = 'Your Name';
  static const String contactNameHint = 'John Carter';

  static const String contactEmailFieldLabel = 'Your Email';
  static const String contactEmailFieldHint = 'john@company.com';

  static const String contactSubjectLabel = 'Subject';
  static const String contactSubjectHint = 'Flutter app for my startup';

  static const String contactMessageLabel = 'Message';
  static const String contactMessageHint =
      'Tell me about the project — what it does, who it is for, and when you '
      'need it live.';

  static const String contactSendAction = 'Send Message';

  /// Sits under the send button, so nobody is surprised by the mail client.
  static const String contactFormNote =
      'Sending opens your mail app with the message ready to go.';

  // ===========================
  // Contact — Validation
  // ===========================

  static const String contactNameError = 'Please enter your name';
  static const String contactEmailRequiredError = 'Please enter your email';
  static const String contactEmailInvalidError = 'Enter a valid email address';
  static const String contactSubjectError = 'Please enter a subject';
  static const String contactMessageError = 'Please write a short message';

  // ===========================
  // Social (semantic labels / tooltips)
  // ===========================

  static const String socialGithub = 'GitHub';
  static const String socialLinkedIn = 'LinkedIn';
  static const String socialInstagram = 'Instagram';
  static const String socialEmail = 'Email';
  static const String socialFiverr = 'Fiverr';

  // ===========================
  // Social URLs (replace with real links)
  // ===========================

  static const String githubUrl = 'https://github.com/OwaisRaza1941';
  static const String linkedInUrl =
      'https://www.linkedin.com/in/owais-raza-47273a347/';
  static const String instagramUrl = 'https://www.instagram.com/build_owaisraza';
  static const String emailUrl = 'mailto:owaisraza55670@gmail.com';
  static const String fiverrUrl = 'https://www.fiverr.com/owaisraza1234?utm_source=chatgpt.com';

  // ===========================
  // Social icon assets (platforms FontAwesome does not ship a glyph for)
  // ===========================

  /// Transparent single-color wordmark, tinted at render time like the glyphs.
  static const String fiverrIconAsset = 'assets/images/fiverr.png';
  static const String downloadCvUrl =
      'https://www.fiverr.com/owaisraza1234/buying?source=avatar_menu_profile';
}
