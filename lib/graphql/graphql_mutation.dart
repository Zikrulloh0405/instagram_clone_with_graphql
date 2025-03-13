const String loginMutation = """
  mutation Login(\$input: Credentials!) {
    login(input: \$input) {
      ... on User {
        id
        userEmail
        followers
        following
        profileImage
      }
      ... on LoginError {
        message
      }
    }
  }
""";