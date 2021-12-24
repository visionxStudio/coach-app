class ApiLink {
  static const base = "https://digicoach.anmup.org/api/v1";

  // Authentication
  static const login = '/firebase/token/verify';
  static const signup = '/api/sanctum/register';

  // Course Related
  static const createCourse = "/course";

  // Coach Related
  static const createCoach = "/coach";
  static const updateUserProfile = "/update-user";

  //profile settings Links
  static const getGoalSetting = "/user/setting/goals";
}
