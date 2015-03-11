namespace Project {

  public class Define : Object {

    public string define = "";

    public Gee.ArrayList<Condition> conditions = new Gee.ArrayList<Condition>();
    public void load (Xml.Node* node) {
      for (Xml.Attr* prop = node->properties; prop != null; prop = prop->next) {
        if (prop->name == "define")
          define = prop->children->content;
      }
      for (Xml.Node* iter = node->children; iter != null; iter = iter->next) {
        if (iter->type != Xml.ElementType.ELEMENT_NODE)
          continue;
        if (iter->name == "condition") {
          var cond = new Condition();
          cond.load (iter);
          conditions.add (cond);
        }
      }
    }
    public void save (Xml.TextWriter writer) {
      writer.write_attribute ("define", define);
      foreach (var cond in conditions)
        cond.save (writer);
    }

  }

}
