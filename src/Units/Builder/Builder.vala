namespace Builder {

  public enum BuilderState {
    NOT_COMPILED,
    COMPILED_OK,
    COMPILED_ERROR,
    COMPILING,
    RUNNING
  }

  public abstract class Builder : Object {

    private BuilderState _state = BuilderState.NOT_COMPILED;
    public BuilderState state {
      get {
        return _state;
      }
      set {
        if (value != _state)
          state_changed();
        _state = value;
      }
    }
    public signal void state_changed();
  
    public string build_dir;
    public Project.ProjectMemberTarget target;
  
    public abstract Gtk.Widget? init_ui();
  
    public abstract void build(Ui.MainWidget main_widget);
    public abstract void run(Ui.MainWidget main_widget);
    public abstract void abort_run();
    public abstract void clean();
    public abstract void load (Xml.Node* node);
    public abstract void save (Xml.TextWriter writer);
  }
}