String getSize(int number) {
  if (number < 10) {
    return "Small";
  } else if (number >= 10 && number < 20) {
    return "Medium";
  } else if (number >= 20 && number < 30) {
    return "Large";
  } else {
    return "Extra Large";
  }
}
