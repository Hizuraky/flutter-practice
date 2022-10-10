import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  // このウィジェットはアプリケーションのトップページです。これはステートフルであり、つまり
  // このウィジェットは、State オブジェクト (以下で定義) を持っています。
  // どのように見えるかに影響するフィールドを含んでいます。
  // このクラスは、状態の設定です。このクラスは状態の設定です。
  // 親ウィジェット（この場合はアプリウィジェット）が提供する値（この場合はタイトル）と
  // State のビルドメソッドで使用されます。Widget サブクラス内のフィールドは
  // 常に "final" とマークされる。

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    debugPrint('The number is $_counter.');
    setState(() {
      // このsetStateの呼び出しは、Flutterフレームワークに、このStateに何か変更があったことを伝える。
      // これにより、以下のビルドメソッドを再実行し、ディスプレイに更新された値を反映させます。
      // 表示に更新された値を反映させるために、以下のビルドメソッドを再実行する。もし
      // setState() を呼び出さずに _counter を変更した場合、ビルドメソッドは再呼び出されないので
      // ビルドメソッドは再コールされないので、何も起こらないように見える。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // このメソッドは setState が呼ばれるたびに再実行されます。
    // 上記の _incrementCounter メソッドによって実行されます。
    // Flutter フレームワークは、ビルドメソッドの再実行を高速化するように最適化されています。
    // 更新が必要なものを個別に変更するのではなく、リビルドするだけで済むように、
    // Flutter フレームワークはビルドメソッドの再実行が高速になるように最適化されています。
    // ウィジェットのインスタンスを個別に変更するのではなく、更新が必要なものを再構築するだけです。
    return Scaffold(
      appBar: AppBar(
        // ここでは、App.buildメソッドで作成されたMyHomePageオブジェクトから値を取得します。
        // App.buildメソッドによって作成されたMyHomePageオブジェクトから値を取得し、それを使用してappbarのタイトルを設定します。
        title: Text(widget.title),
      ),
      body: Center(
        // Center はレイアウトウィジェットです。子プロセスを 1 つ受け取り、それを親の中央に配置します。
        // 親の中央に配置します。
        child: Column(
          // Column はレイアウトウィジェットでもあります。子プロセスのリストを受け取り
          // それらを縦に並べます。デフォルトでは
          // また、親と同じ高さになるようにします。
          // 「デバッグペイント」を呼び出す（コンソールで「p」を押し、「デバッグペイントの切り替え」を選択する）。
          // Android StudioのFlutter Inspectorから
          // "Toggle Debug Paint "アクションを選択する。
          // コンソールで "p "を押す、Android StudioのFlutter Inspectorで "Toggle Debug Paint "アクションを選ぶ、またはVisual Studio Codeで "Toggle Debug Paint "コマンドを選ぶ）。
          // 各ウィジェットのワイヤーフレームを見るには
          // カラムには、サイズや子ウィジェットの位置を制御するための様々なプロパティがあります。
          // 子ウィジェットをどのように配置するかを制御します。ここでは、mainAxisAlignment を使用しています。
          // ここでは、mainAxisAlignment を使用して、子ウィジェットを垂直方向に配置しています。
          // 列は垂直であるため、ここでの主軸は垂直軸です（横軸は
          // 水平）。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
