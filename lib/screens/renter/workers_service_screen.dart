import 'package:flutter/material.dart';
import 'package:iclean_flutter/screens/renter/worker_service_details_.dart';
import '../../models/services.dart';
import '../../models/workers.dart';

class WorkerServiceScreen extends StatefulWidget {
  final Service service;
  const WorkerServiceScreen({super.key, required this.service});

  @override
  State<WorkerServiceScreen> createState() => _WorkerServiceScreenState();
}

class _WorkerServiceScreenState extends State<WorkerServiceScreen> {
  List<Worker> worker = [];

  @override
  void initState() {
    super.initState;
    //fetchWorker(widget.service.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
        child: Column(children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 15),
              Text(
                widget.service.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          for (int i = 0; i < worker.length; i++)
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WorkerDetailsScreen(
                                service: widget.service, worker: worker[i])));
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 4,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.network(
                          worker[i].image,
                          width: 70,
                          height: 70,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 15, bottom: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                worker[i].name,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "\$${worker[i].price}",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato',
                                  color: Colors.deepPurple.shade300,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      "${worker[i].address}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Lato',
                                        color: Colors.grey.shade600,
                                      ),
                                      maxLines:
                                          2, // Allow the Text widget to wrap to as many lines as needed.
                                      overflow: TextOverflow
                                          .ellipsis, // Specify what to display if the Text widget overflows.
                                      softWrap:
                                          true, // Allow the text to wrap to new lines.
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
        ]),
      ),
    )));
  }

  // Future<void> fetchWorker(int id) async {
  //   final listWorkers = await WorkerAPI.fetchWorkerByService(id);
  //   setState(() {
  //     worker = listWorkers;
  //   });
  // }
}
