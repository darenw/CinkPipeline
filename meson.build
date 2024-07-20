project('CinkPipeline', 'vala', 'c')


sources = files(
  'src/main.vala',
  'src/clean.vala',
  'src/prep.vala',
  'src/split.vala',
  'src/linework.vala',
  'src/colorwork.vala',
  'src/snuff.vala',
  'src/composit.vala'
)


deps = [
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('gio-2.0'),
  dependency('gegl-0.4')
]


executable('cinkpipe', sources, dependencies:deps)
