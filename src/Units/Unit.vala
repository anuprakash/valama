namespace Units {

  public abstract class Unit : Object {
    public Ui.MainWidget main_widget;
    public abstract void init();
    public abstract void destroy();
  }

}