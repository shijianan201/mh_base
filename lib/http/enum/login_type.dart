enum LoginType {
  phone(code: 1),
  line(code: 2),
  facebook(code: 3),
  google(code: 4),
  apple(code: 5);

  final int code;

  const LoginType({required this.code});
}
