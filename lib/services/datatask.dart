import 'package:supabase_flutter/supabase_flutter.dart';

class Datatask {
  final supa = Supabase.instance.client;
  create(String title, String userid, bool bool, String context) async {
    final user = Supabase.instance.client.auth.currentUser;

    await supa.from('task').insert({
      'title': title,
      'is_done': false,
      'user_id': user!.id,
      'context': context,
    });
  }

  Future<List<Map<String, dynamic>>> read() async {
    final userId = Supabase.instance.client.auth.currentUser!.id;

    return await supa
        .from('task')
        .select()
        .eq('user_id', userId)
        .order('created_at');
  }

  update(int id, String title, bool is_done, String context) async {
    return await supa
        .from('task')
        .update({'title': title, 'is_done': is_done, 'context': context})
        .eq('id', id);
  }

  delete(int id) async {
    return await supa.from('task').delete().eq('id', id);
  }
}
