class AssignmentData {
  final String subjectName;
  final String topicName;
  final String assignDate;
  final String lastDate;
  final String status;

  AssignmentData(this.subjectName, this.topicName, this.assignDate, this.lastDate, this.status);
}

List<AssignmentData> assignment = [
  AssignmentData(
      '1ª Classe', 'Red Blood Cells', '17 Nov 2021', '20 Nov 2021', 'Pending'),
  AssignmentData(
      '2ª Classe', 'bohr theory', '11 Nov 2021', '20 Nov 2021', 'Submitted'),
  AssignmentData('3ª Classe', 'Organic Chemistry', '21 Oct 2021', '27 Oct 2021', 'Not Submitted'),
  AssignmentData('4ª Classe', 'Algebra', '17 Sep 2021', '30 Sep 2021', 'Pending'),
  AssignmentData('5ª Classe', 'Algebra', '17 Sep 2021', '30 Sep 2021', 'Pending'),
  AssignmentData('6ª Classe', 'Algebra', '17 Sep 2021', '30 Sep 2021', 'Pending'),
];
