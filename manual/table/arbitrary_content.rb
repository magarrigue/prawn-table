# encoding: utf-8
#
# If you need to render arbitrary Prawn code inside a table,
# provide a <code>render</code> block that will be run after the
# standard cell content is drawn.
#
# Note that the cell will not be able to determine the size of
# the custom content, so you will have to ensure sufficient
# width and height to contain it.
#
require File.expand_path(File.join(File.dirname(__FILE__),
                                   %w[.. example_helper]))
filename = File.basename(__FILE__).gsub('.rb', '.pdf')
Prawn::ManualBuilder::Example.generate(filename) do
  custom_cell = make_cell(:content => "", width: 300, height: 200)

  custom_cell.render do |pdf|
    pdf.rectangle([10, 150], 200, 100)
    pdf.text "hello from custom render!"
  end

  table([ ["standard", "text", "cells"],
          ["custom ->", custom_cell, "<- custom"],
          ["more", "standard", "cells"],
        ])
end
