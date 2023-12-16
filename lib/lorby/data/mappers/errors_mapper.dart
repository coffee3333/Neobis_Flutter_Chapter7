mixin ErrorsMapper {
  List<String> convertMap(Map<String, dynamic> inputMap) {
    List<String> outputList = [];

    inputMap.forEach((key, messages) {
      messages.forEach((message) {
        outputList.add(message);
      });
    });

    return outputList;
  }
}
