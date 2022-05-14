part of 'router.dart';

Future<Response> _toxicLevelUpdatedRoute(Request req) async {
  try {
    final body = await req.readAsString();
    final dynamic decoded = json.decode(body);
    final toxicLevel = (decoded as Map<String, dynamic>)['level'] as int;
    if (toxicLevel >= 0 && toxicLevel <= 4) {
      locator<ToxicLevelService>().updateToxicLevel(toxicLevel);
      return Response.ok('Ok');
    }
    return Response.badRequest();
  } catch (error, stack) {
    print(error);
    print(stack);
    return Response.internalServerError();
  }
}
