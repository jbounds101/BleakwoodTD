mouse_hoverering = false;

// Adjust to fit screen properly
scale = view_wport[0] / camera_get_view_width(view_camera[0]);

x *= scale;
y *= scale;

image_xscale = scale;
image_yscale = scale;
