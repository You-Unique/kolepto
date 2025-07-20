// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kolepto/screens/shared_utils/extension.dart';
import 'package:kolepto/screens/shared_utils/hovering_container.dart';
import 'package:kolepto/screens/shared_utils/input_field.dart';

class CreatecolectionsScreen extends StatefulWidget {
  const CreatecolectionsScreen({super.key});

  @override
  State<CreatecolectionsScreen> createState() => _CreatecolectionsScreenState();
}

class _CreatecolectionsScreenState extends State<CreatecolectionsScreen> {
  bool createCollectionText = false;
  bool previewCollectionText = false;
  bool createContainer = false;

  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _deadline =
      TextEditingController(); // Add this controller

  bool passwordobscure = false;
  bool confirmpasswordobscure = false;
  bool borderColorTitle = false;
  bool borderColorDescription = false;
  bool borderColorAmount = false;
  bool borderColorDeadline = false;
  bool isHovering = false;
  bool toggleContainer = false;

  void toggleCounter() {
    setState(() {
      toggleContainer = !toggleContainer;
    });
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Collection',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.green[900],
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.vSpace,
              const Text(
                'Create a New Collection',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              20.vSpace,
              Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MouseRegion(
                      onEnter: (_) =>
                          setState(() => previewCollectionText = false),
                      onExit: (_) =>
                          setState(() => previewCollectionText = true),
                      child: HoveringContainer(
                        exit_color: createCollectionText == false &&
                                previewCollectionText
                            ? Colors.grey
                            : Colors.green[900],
                        entry_color: createCollectionText
                            ? Colors.green[900]
                            : Colors.green[900],
                        width: 170,
                        height: 40,
                        text: 'Create Collection',
                        textColor: createCollectionText
                            ? Colors.black54
                            : Colors.white,
                        icon: Icons.add_box,
                        iconColor: createCollectionText
                            ? Colors.black54
                            : Colors.white,
                      ),
                    ),
                    MouseRegion(
                      onEnter: (_) =>
                          setState(() => createCollectionText = false),
                      onExit: (_) =>
                          setState(() => createCollectionText = true),
                      child: HoveringContainer(
                        exit_color: previewCollectionText == false &&
                                createCollectionText
                            ? Colors.grey
                            : Colors.grey,
                        entry_color: previewCollectionText == true &&
                                createCollectionText == true
                            ? Colors.grey
                            : Colors.green[900],
                        width: 170,
                        height: 40,
                        text: 'Preview Collection',
                        textColor: previewCollectionText == true &&
                                createCollectionText
                            ? Colors.white
                            : Colors.black54,
                        icon: Icons.remove_red_eye_outlined,
                        iconColor: previewCollectionText == true &&
                                createCollectionText
                            ? Colors.white
                            : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              30.vSpace,
              Container(
                width: 800,
                height: 630,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Collection Details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      10.vSpace,
                      const Text(
                        'Collection Title',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      5.vSpace,
                      MouseRegion(
                        onEnter: (_) => setState(() => borderColorTitle = true),
                        onExit: (_) => setState(() => borderColorTitle = false),
                        child: InputField(
                          textEditingController: _title,
                          hint: 'e.g. School Reunin Contribution',
                          bordercolor: borderColorTitle
                              ? Colors.green
                              : Colors.transparent,
                        ),
                      ),
                      20.vSpace,
                      const Text(
                        'Description (Optional)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      5.vSpace,
                      MouseRegion(
                        onEnter: (_) =>
                            setState(() => borderColorDescription = true),
                        onExit: (_) =>
                            setState(() => borderColorDescription = false),
                        child: InputField(
                          textEditingController: _description,
                          hint: 'Describe what this contribution is for',
                          bordercolor: borderColorDescription
                              ? Colors.green
                              : Colors.transparent,
                        ),
                      ),
                      20.vSpace,
                      const Text(
                        'Deadline',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      5.vSpace,
                      MouseRegion(
                        onEnter: (_) =>
                            setState(() => borderColorDeadline = true),
                        onExit: (_) =>
                            setState(() => borderColorDeadline = false),
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (pickedDate != null) {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (pickedTime != null) {
                                final dt = DateTime(
                                  pickedDate.year,
                                  pickedDate.month,
                                  pickedDate.day,
                                  pickedTime.hour,
                                  pickedTime.minute,
                                );
                                _deadline.text =
                                    "${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')} ${pickedTime.format(context)}";
                                setState(() {});
                              }
                            }
                          },
                          child: AbsorbPointer(
                            child: InputField(
                              textEditingController: _deadline,
                              hint: 'yyyy-mm-dd  hh:mm',
                              bordercolor: borderColorDeadline
                                  ? Colors.green
                                  : Colors.transparent,
                              suffixWidget: Icon(
                                Icons.calendar_today,
                                size: 18,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                      ),
                      20.vSpace,
                      const Text(
                        'Amount per Person (NGN)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      MouseRegion(
                        onEnter: (_) =>
                            setState(() => borderColorAmount = true),
                        onExit: (_) =>
                            setState(() => borderColorAmount = false),
                        child: InputField(
                          textEditingController: _amount,
                          hint: 'e.g. 2000',
                          bordercolor: borderColorAmount
                              ? Colors.green
                              : Colors.transparent,
                        ),
                      ),
                      20.vSpace,
                      const Text(
                        'Max number of contributions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      5.vSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: toggleCounter,
                            child: Stack(
                              children: [
                                Container(
                                  width: 70,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: toggleContainer
                                        ? Colors.green[900]
                                        : Colors.grey,
                                  ),
                                ),
                                Positioned(
                                  top: 2,
                                  left: toggleContainer ? 35 : 0,
                                  right: toggleContainer ? 0 : 35,
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: toggleContainer
                                          ? Colors.white
                                          : Colors.grey[300]!,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          toggleContainer
                              ? _CounterInput()
                              : const SizedBox.shrink(),
                        ],
                      ),
                      80.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HoveringContainer(
                            width: 300,
                            height: 40,
                            text: 'Create Collection',
                            icon: Icons
                                .create, // Changed to a more explicit sign-up icon
                            entry_color: Colors.green[700],
                            exit_color: Colors.green[900],
                            textColor: Colors.white,
                            iconColor: Colors.white,
                            onTap: () {}, // No act
                          ),
                          20.hSpace,
                          HoveringContainer(
                            onTap: () {},
                            width: 300,
                            height: 40,
                            text: 'Cancel',
                            icon: Icons
                                .cancel_outlined, // Changed to a more explicit enter/sign-in icon
                            entry_color: Colors.orangeAccent,
                            exit_color: Colors.transparent,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CounterInput extends StatefulWidget {
  @override
  State<_CounterInput> createState() => _CounterInputState();
}

class _CounterInputState extends State<_CounterInput> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 36,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.remove, size: 18),
            onPressed: () {
              setState(() {
                if (_count > 0) _count--;
              });
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          Expanded(
            child: Center(
              child: Text(
                '$_count',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add, size: 18),
            onPressed: () {
              setState(() {
                _count++;
              });
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
