class StringUtil {

  static String formatHtml (String text){
    return text.replaceAll(RegExp(r'<p>|<em>|</em>'), '')
    .replaceAll(RegExp(r'</p>'), '\n');
  }
  
}