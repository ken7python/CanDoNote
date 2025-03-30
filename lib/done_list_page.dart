import 'package:flutter/material.dart';

class DoneListPage extends StatefulWidget {
  @override
  _DoneListPageState createState() => _DoneListPageState();
}

class _DoneListPageState extends State<DoneListPage> {
  final List<TextEditingController> _controllers = List.generate(3, (_) => TextEditingController());

  void _saveEntries() {
    List<String> doneList = _controllers.map((c) => c.text).toList();
    print("保存された内容: $doneList"); // ここをデータ保存処理に変更
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("保存しました！")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("今日のできたこと")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (int i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _controllers[i],
                  decoration: InputDecoration(
                    labelText: "できたこと ${i + 1}",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveEntries,
              child: Text("保存"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
