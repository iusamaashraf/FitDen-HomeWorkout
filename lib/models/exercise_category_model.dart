class ExerciseCategoryImageData {
  final String imgPath;
  final String exerciseName;

  ExerciseCategoryImageData({
    required this.imgPath,
    required this.exerciseName,
  });
}

List<ExerciseCategoryImageData> exerciseCategoryImageData = [
  ExerciseCategoryImageData(
    imgPath: 'assets/images/weight_gain.jpg',
    exerciseName: 'Weight Gain',
  ),
  ExerciseCategoryImageData(
    imgPath: 'assets/images/weight_loose.jpg',
    exerciseName: 'Weight Loose',
  ),
  ExerciseCategoryImageData(
    imgPath: 'assets/images/looksmart.png',
    exerciseName: 'Looks Better',
  ),
];
