import gdstk
import pathlib
gds = sorted(pathlib.Path('.').glob('gds/tiny_user_project.gds'))
library = gdstk.read_gds(gds[-1])
top_cells = library.top_level()
top_cells[0].write_svg('gds_render.svg')
import cairosvg
cairosvg.svg2png(url='gds_render.svg', write_to='gds_render.png')