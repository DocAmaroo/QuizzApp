import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz/bloc/quizz_bloc.dart';
import 'package:quizz/data/services/quizz_services.dart';
import 'package:quizz/utils/app_colors.dart';
import 'package:quizz/utils/theme/app_theme.dart';
import 'package:quizz/utils/utils.dart';

class HomePage extends StatefulWidget {
  final String title;
  final AppTheme? theme;

  const HomePage({Key? key, required this.title, this.theme}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _quizzServices = QuizzServices();
  String? _dropdownThemeValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: _getAppBarActions()),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Bienvenue !',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1),
              Wrap(
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Text('Prêt à tester ta culture G ?',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4),
                    Text('Alors choisis un thème et \n lance toi !',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5),
                  ]),
              StreamBuilder<QuerySnapshot>(
                stream: _quizzServices.questionSnapshots,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Unable de fetch data!',
                        style: Theme.of(context).textTheme.headline2);
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor));
                  }
                  if (!snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    return Text('No theme!',
                        style: Theme.of(context).textTheme.headline2);
                  } else {
                    List allThemes = snapshot.data!.docs
                        .map((data) => data['theme'])
                        .map((e) => (Utils.capitalize(e)))
                        .toSet()
                        .toList();

                    return DropdownButton<String>(
                        underline: Container(
                          height: 1,
                          color: Theme.of(context).primaryColor,
                        ),
                        hint: const Text('Sélectionnez un thème'),
                        value: _dropdownThemeValue,
                        items: allThemes.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _dropdownThemeValue = value!;
                          });
                        });
                  }
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    // Make sure a theme has been selected and start the quizz,
                    // otherwise prevent the user with a snackbar.
                    if (_dropdownThemeValue == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Theme.of(context).errorColor,
                          duration: const Duration(seconds: 2),
                          content: const Text('Aucun thème sélectionné.')));
                    } else {
                      BlocProvider.of<QuizzBloc>(context).add(
                          LoadQuizz(theme: _dropdownThemeValue!.toLowerCase()));
                      Navigator.pushNamed(context, '/quizz');
                    }
                  },
                  child:
                      Text("Lancer", style: Theme.of(context).textTheme.button),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      onPrimary: AppColors.textLight))
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getAppBarActions() {
    return [
      if (widget.theme != null)
        IconButton(
            icon: Icon(widget.theme!.icon),
            tooltip: 'Light/Dark mode',
            onPressed: () {
              widget.theme!.toggleMode();
            })
    ];
  }
}
