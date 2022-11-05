var size = 100000;
var buffer = buffer_create(size * buffer_sizeof(buffer_s32), buffer_fixed, 1);

var i = 1;
while (buffer_tell(buffer) < buffer_get_size(buffer)) {
    buffer_write(buffer, buffer_s32, i);
    i++;
}

function gml_buffer_sum(buffer) {
    var total = 0;
    
    buffer_seek(buffer, buffer_seek_start, 0);
    repeat (buffer_get_size(buffer) / buffer_sizeof(buffer_s32)) {
        total += buffer_read(buffer, buffer_s32);
    }
    
    return total;
}

var expected_answer = size * (size + 1) / 2;

show_debug_message("Expected answer: " + string(expected_answer));

var t_start = get_timer();
show_debug_message("DLL answer: " + string(FancyBufferSum(buffer_get_address(buffer), size)));
var t_finish = get_timer();
show_debug_message("  DLL time: " + string((t_finish - t_start) / 1000) + " ms");

t_start = get_timer();
show_debug_message("GML answer: " + string(gml_buffer_sum(buffer)));
t_finish = get_timer();
show_debug_message("  GML time: " + string((t_finish - t_start) / 1000) + " ms");