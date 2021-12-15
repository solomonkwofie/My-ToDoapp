import 'package:flutter/material.dart';

class CreateToDo extends StatelessWidget {
  CreateToDo({Key? key}) : super(key: key);
  final GlobalKey<FormState> createTodokey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crete To-Do"),
      ),
      body: Form(
        key: createTodokey,
        child: ListView(
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "This Field must not be empty";
                }
              },
              decoration: const InputDecoration(label: Text("Title")),
            ),
            const SizedBox(
              height: 100,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "This Field can not be empty";
                }
              },
              decoration: const InputDecoration(label: Text("Description")),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now());
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field can not be empty";
                      }
                    },
                    decoration: const InputDecoration(label: Text("Date")),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field can not be empty";
                      }
                    },
                    decoration: const InputDecoration(label: Text("Time")),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                  onPressed: () {
                    if (createTodokey.currentState!.validate()) {
                      // send to database
                    } else {
                      // dont send databasa
                    }
                  },
                  child: const Text(
                    "Create",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
