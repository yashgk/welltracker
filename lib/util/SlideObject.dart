class SliderModel{
  String imagePath;

  SliderModel({this.imagePath});

  void setImagePath(String path)
  {
    this.imagePath=path;
  }
  String getImagePath()
  {
    return imagePath;
  }
}
List<SliderModel> getSlides()
{
  List<SliderModel> slides = new List<SliderModel>();

  //image 1
  SliderModel sliderModel=new SliderModel();
  sliderModel.setImagePath("asset/1.png");
  slides.add(sliderModel);
  //image 2
  sliderModel=new SliderModel();
  sliderModel.setImagePath("asset/2.png");
  slides.add(sliderModel);
  //image 3
  sliderModel=new SliderModel();
  sliderModel.setImagePath("asset/3.png");
  slides.add(sliderModel);
  //image 4
  sliderModel=new SliderModel();
  sliderModel.setImagePath("asset/4.png");
  slides.add(sliderModel);
  //image 5
  sliderModel=new SliderModel();
  sliderModel.setImagePath("asset/5.png");
  slides.add(sliderModel);

  return slides;
}