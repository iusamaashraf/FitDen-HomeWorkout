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
    imgPath: 'assets/images/weightgain.png',
    exerciseName: 'Weight Gain',
  ),
  ExerciseCategoryImageData(
    imgPath: 'assets/images/weightloose.png',
    exerciseName: 'Weight Loose',
  ),
  ExerciseCategoryImageData(
    imgPath: 'assets/images/looksbetter.png',
    exerciseName: 'Looks Better',
  ),
];
