import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jobnow_users/models/jobs_model.dart';
import 'package:jobnow_users/models/jobseeker_model.dart';

class HttpService {
  final String jobsURL = "http://192.168.0.136:8000/api/all_jobs";
  final String deleteURL = "http://192.168.0.136:8000/api/jobs";
  final String jobseekerURL = "http://192.168.0.136:8000/api/jobseeker";

  Future<List<JobsModel>> getJobs() async {
    Response res = await http.get(Uri.parse(jobsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<JobsModel> jobs = body
          .map(
            (dynamic item) => JobsModel.fromJson(item),
      )
          .toList();

      return jobs;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
  Future<void> updateJobs(int id) async {
    Response res = await http.put(Uri.parse("$jobsURL/$id"));

    if (res.statusCode == 200) {
      print("Updated");
    } else {
      throw "Unable to update post.";
    }
  }
  Future<void> deleteJob(int id) async {
    Response res = await http.delete(Uri.parse("$deleteURL/$id"));

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Unable to delete post.";
    }
  }
  Future<List<JobseekerModel>> getJobseeker() async {
    Response res = await http.get(Uri.parse(jobseekerURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<JobseekerModel> jobseekers = body
          .map(
            (dynamic item) => JobseekerModel.fromJson(item),
      )
          .toList();

      return jobseekers;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}