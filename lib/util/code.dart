import 'package:flutter/material.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/atom-one-dark.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:google_fonts/google_fonts.dart';

// Courtesy of https://stackoverflow.com/a/70733069
class CodeElementBuilder extends MarkdownElementBuilder {
  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    var language = '';

    if (element.attributes['class'] != null) {
      String lg = element.attributes['class'] as String;
      language = lg.substring(9);
    }

    return SizedBox(
      width: double.infinity,
      child: HighlightView(
        // The original code to be highlighted
        element.textContent,
        // It is recommended to give it a value for performance
        language: language,
        // All available themes are listed in `themes` folder
        theme: atomOneDarkTheme,
        padding: const EdgeInsets.all(8),
        textStyle: GoogleFonts.robotoMono(),
      ),
    );
  }
}
