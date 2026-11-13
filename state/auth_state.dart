class AuthState {
  static bool isLoggedIn = false;
  static String username = '';

  static void login(String name) {
    isLoggedIn = true;
    username = name;
  }

  static void logout() {
    isLoggedIn = false;
    username = '';
  }
}