import 'package:ekam/controller/select_package_controller.dart';
import 'package:ekam/model/appointment_package.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPackagePage extends StatelessWidget {
  SelectPackagePage({super.key});

  final _controller = Get.put(SelectPackageController(
    Get.arguments['doctorDetails'],
    Get.arguments['selectedTimeslot'],
    Get.arguments['package'],
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Package"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Select Duration",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Obx(
              () => Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10.0),
                    underline: Container(),
                    isExpanded: true,
                    value: _controller.selectedDuration.value,
                    items: _controller.durations
                        .map((e) => DropdownMenuItem<String>(
                              value: e,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(Icons.watch_later_rounded, color: Colors.blueAccent,),
                                  SizedBox(width: 10,),
                                  Text(e),
                                ],
                              ),
                            ))
                        .toList(),
                    onChanged: _controller.selectedDuration),
              ),
            ),
            SizedBox(height: 30),
            const Text(
              "Select Package",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Obx(
              () => _buildPackagesListView(_controller.selectedPackage.value),
            ),
            Spacer(),
            ElevatedButton(onPressed: _controller.next, child: Text("Next")),
          ],
        ),
      ),
    );
  }

  ListView _buildPackagesListView(String selected) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: _controller.packages.length,
      itemBuilder: (_, index) => PackageItem(
          package: _controller.packages[index],
          selected: selected,
          onClick: () =>
              _controller.selectPackage(_controller.packages[index])),
      separatorBuilder: (_, __) => const SizedBox(height: 10),
    );
  }
}

class PackageItem extends StatelessWidget {
  const PackageItem({
    super.key,
    required this.package,
    required this.selected,
    required this.onClick,
  });

  final String package;

  IconData get iconData => package.iconData;

  String get primaryText => package;

  String get secondaryText => package.secondaryText;
  final String selected;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueAccent.withOpacity(.2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    iconData,
                    color: Colors.blueAccent,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      primaryText,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      secondaryText,
                      style: const TextStyle(
                          fontSize: 12.0, color: Colors.black38),
                    )
                  ],
                ),
              ),
              Radio(
                value: primaryText,
                groupValue: selected,
                onChanged: (_) {},
                activeColor: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
