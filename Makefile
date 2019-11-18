# On MacOS, OSC could be /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
OSC = openscad
OSCFLAGS = 
ODIR = models

_OBJ = body.stl disk.stl key.stl
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.stl:  %.scad
	@ mkdir -p $(ODIR)
	$(OSC) $(OSCFLAGS) $< -o $@

lockset.stl: $(OBJ) lockset.scad
	$(OSC) $(OSCFLAGS) lockset.scad -o lockset.stl

all: lockset.stl

clean:
	rm -f $(ODIR)/*.stl
	rm -f lockset.stl