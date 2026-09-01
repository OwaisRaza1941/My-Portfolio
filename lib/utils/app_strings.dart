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

  static const String heroBadge = 'Available for Freelance';

  static const String heroGreeting = "Hi, I'm";

  static const String heroRoleLine = 'Flutter Developer';

  static const String heroHeadline =
      'Building Fast, Scalable\nFlutter Applications';

  static const String heroDescription =
      'I help businesses and startups build high-performance mobile and web '
      'applications using Flutter, Firebase, and Clean Architecture. From UI '
      'development to backend integration, I create responsive, scalable, and '
      'production-ready solutions.';

  // ===========================
  // Availability
  // ===========================

  static const String availability = 'Open to Work';

  // ===========================
  // About — Header
  // ===========================
  static const String aboutBadgeEmoji = '👋';

  static const String aboutBadge = 'About Me';

  static const String aboutTitle = 'Building Apps That Users Love';

  static const String aboutSubtitle =
      'Flutter Developer specializing in modern, scalable, and '
      'high-performance mobile & web applications.';

  // ===========================
  // About — Right Column
  // ===========================

  static const String aboutHeadline =
      'Helping businesses turn ideas\ninto successful digital products';

  static const String aboutParagraphOne =
      'I am Owais Raza, a Flutter Developer passionate about building '
      'high-quality mobile and web applications. I help startups, businesses, '
      'and individuals transform their ideas into fast, responsive, and '
      'production-ready apps using Flutter and Firebase.';

  static const String aboutParagraphTwo =
      'My focus is writing clean, maintainable code with modern architecture, '
      'responsive UI, and scalable solutions. Whether it is a new product, '
      'feature development, or app improvement, I build applications that are '
      'easy to maintain and ready for future growth.';

  // ===========================
  // About — Highlights
  // ===========================

  static const String aboutHighlightArchitectureTitle = 'Clean Architecture';

  static const String aboutHighlightArchitectureBody =
      'Scalable and maintainable code for long-term projects.';

  static const String aboutHighlightUiTitle = 'Responsive UI';

  static const String aboutHighlightUiBody =
      'Modern interfaces that work perfectly across all screen sizes.';

  static const String aboutHighlightCrossPlatformTitle = 'Cross-Platform Apps';

  static const String aboutHighlightCrossPlatformBody =
      'One Flutter codebase for Android, iOS, and Flutter Web.';

  static const String aboutHighlightPerformanceTitle = 'Performance Optimized';

  static const String aboutHighlightPerformanceBody =
      'Fast, smooth, and production-ready Flutter applications.';

  // ===========================
  // About — Stats
  // ===========================

  static const String aboutStatExperienceValue = '1+';
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
      'Production-focused Flutter applications showcasing clean architecture, '
      'responsive UI, Firebase integration, state management, and scalable '
      'mobile solutions.';
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
      'A complete e-commerce application built with Flutter and Firebase, '
      'allowing users to browse products, manage their cart, authenticate '
      'securely, and place orders through a modern, responsive interface.';
  static const List<String> projectSwiftCartFeatures = [
    'Firebase Authentication',
    'Product search & category filters',
    'Shopping cart & favorites',
    'Dynamic Product Detail Screen '
        'Clean GetX architecture',
    'Checkout Screen & Place Order',
  ];
  static const List<String> projectSwiftCartTech = [
    'Flutter',
    'Firebase',
    'GetX',
    'Firestore',
    'MVC Architecture',
  ];

  static const String projectFoodTitle = 'BoBo Food';
  static const String projectFoodCategory = 'BoBo AI Food Delivery App';
  static const String projectFoodBody =
      'A modern food ordering application featuring restaurant browsing, menu '
      'categories, cart management, and responsive UI designed for smooth user '
      'experience.';
  static const List<String> projectFoodFeatures = [
    'Restaurant & menu browsing',
    'Shopping cart',
    'Responsive UI',
    'Smooth animations',
  ];
  static const List<String> projectFoodTech = [
    'Flutter',
    'GetX',
    'Firebase',
    'REST API',
  ];

  static const String projectNestAiTitle = 'NestAI';
  static const String projectNestAiCategory = 'Real Estate Website';
  static const String projectNestAiBody =
      'An AI-assisted real estate website where buyers browse listings, '
      'filter by location, price and property type, view full listing '
      'details, and contact the listing agent directly to schedule a tour.';
  static const List<String> projectNestAiFeatures = [
    'Property search with an AI assistant',
    'Filterable listings grid (type, status, price)',
    'Detailed listing pages with agent info',
    'Contact agent & schedule-a-tour forms',
  ];
  static const List<String> projectNestAiTech = [
    'Flutter Web',
    'Responsive UI',
    'AI Search',
  ];

  static const String projectFishWebsiteTitle = 'Fish Website';
  static const String projectFishWebsiteCategory = 'Fish E-Commerce Website';
  static const String projectFishWebsiteBody =
      'A modern full-stack fish e-commerce website built with the MERN stack and TypeScript, '
      'where customers can browse fresh seafood products, search and filter products, '
      'view detailed product information, manage their cart, and place orders through '
      'a responsive and user-friendly interface.';
  static const List<String> projectFishWebsiteFeatures = [
    'Fresh fish and seafood product listings',
    'Product search, filtering and category browsing',
    'Detailed product pages with dynamic data',
    'Shopping cart and order management',
    'Responsive design for desktop and mobile',
    'MERN stack full-stack architecture',
  ];
  static const List<String> projectFishWebsiteTech = [
    'React',
    'TypeScript',
    'Node.js',
    'Express.js',
    'MongoDB',
    'Tailwind CSS',
    'REST API',
  ];

  static const String projectMedicareTitle = 'MedCare';
  static const String projectMedicareCategory = 'Healthcare Website';
  static const String projectMedicareBody =
      'A professional healthcare website built with React, TypeScript and Supabase, '
      'designed to help patients explore medical departments, doctors and healthcare services '
      'and book appointments through an easy-to-use online appointment system.';
  static const List<String> projectMedicareFeatures = [
    'Doctor and department information',
    'Online appointment booking system',
    'Dynamic appointment form with Supabase',
    'Patient appointment data management',
    'Responsive healthcare-focused UI',
    'Supabase database integration',
    'Form validation and error handling',
  ];
  static const List<String> projectMedicareTech = [
    'React',
    'TypeScript',
    'Supabase',
    'Tailwind CSS',
    'Vite',
    'Responsive UI',
  ];

static const String projectRestaurantTitle = 'Restaurant Website';
static const String projectRestaurantCategory = 'Restaurant Website';
static const String projectRestaurantBody =
    'A modern and responsive restaurant website built with React, TypeScript and Tailwind CSS, '
    'designed to showcase the restaurant menu, featured dishes, services and contact information '
    'with an engaging and user-friendly interface.';

static const List<String> projectRestaurantFeatures = [
  'Modern restaurant landing page',
  'Dynamic food menu and category sections',
  'Featured dishes and food cards',
  'Restaurant services and information',
  'Contact and reservation section',
  'Responsive design for mobile and desktop',
  'Smooth and interactive user experience',
];

static const List<String> projectRestaurantTech = [
  'React',
  'TypeScript',
  'Tailwind CSS',
  'Vite',
  'Responsive UI',
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

  /// Repo for the SwiftCart project card's View Code / Live Demo actions.
  static const String swiftCartRepoUrl =
      'https://github.com/OwaisRaza1941/SwiftCart-E--commerce-App';

  /// Live Build for the Bobo food Github Url
  static const String nestAiLiveUrl = 'https://nestai-realestate.vercel.app/';

  // Live Build for the Bobo food Github Url
  static const String marinaCoLive = 'https://nestai-realestate.vercel.app/';

  /// Live build for the NestAI project card's Live Demo action.
  static const String boboLiveUrl =
      'https://github.com/OwaisRaza1941/BOBO-Food-App';

  static const String linkedInUrl =
      'https://www.linkedin.com/in/owais-raza-47273a347/';
  static const String instagramUrl =
      'https://www.instagram.com/build_withowaisraza?igsh=MXFta2c3cTVucXNqcw==';
  static const String emailUrl = 'mailto:owaisraza55670@gmail.com';
  static const String fiverrUrl =
      'https://www.fiverr.com/owaisraza1234?utm_source=chatgpt.com';

  // ===========================
  // Social icon assets (platforms FontAwesome does not ship a glyph for)
  // ===========================

  /// Transparent single-color wordmark, tinted at render time like the glyphs.
  static const String fiverrIconAsset = 'assets/images/fiverr.png';
  static const String downloadCvUrl =
      'https://drive.google.com/file/d/1Qak1MgKYqNO5Pja83tSIz-CR4J6pPPHf/view?usp=sharing';
}
