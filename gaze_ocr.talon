mode: command
mode: dictation
-
(eye | i) (hover | [cursor] move): user.move_cursor_to_gaze_point()
(eye | i) [left] (touch | click):
    user.move_cursor_to_gaze_point()
    mouse_click(0)
(eye | i) [left] double (touch | click):
    user.move_cursor_to_gaze_point()
    mouse_click(0)
    mouse_click(0)
(eye | i) right (touch | click):
    user.move_cursor_to_gaze_point()
    mouse_click(1)
(eye | i) middle (touch | click):
    user.move_cursor_to_gaze_point()
    mouse_click(2)
(eye | i) <user.modifiers> (touch | click):
    user.move_cursor_to_gaze_point()
    key("{modifiers}:down")
    mouse_click(0)
    key("{modifiers}:up")

scroll up:
    user.move_cursor_to_gaze_point(0, 40)
    user.mouse_scroll_up()
scroll up half:
    user.move_cursor_to_gaze_point(0, 40)
    user.mouse_scroll_up(0.5)
scroll down:
    user.move_cursor_to_gaze_point(0, -40)
    user.mouse_scroll_down()
scroll down half:
    user.move_cursor_to_gaze_point(0, -40)
    user.mouse_scroll_down(0.5)
scroll left:
    user.move_cursor_to_gaze_point(40, 0)
    user.mouse_scroll_left()
scroll left half:
    user.move_cursor_to_gaze_point(40, 0)
    user.mouse_scroll_left(0.5)
scroll right:
    user.move_cursor_to_gaze_point(-40, 0)
    user.mouse_scroll_right()
scroll right half:
    user.move_cursor_to_gaze_point(-40, 0)
    user.mouse_scroll_right(0.5)

# parrot(shush):
#     user.move_cursor_to_gaze_point(0, -40)
#     user.power_momentum_scroll_down()
#     user.power_momentum_start(ts, 2.0)
# parrot(shush:repeat):
#     user.power_momentum_add(ts, power)
# parrot(shush:stop):
#     user.power_momentum_decaying()

# parrot(fff):
#     user.move_cursor_to_gaze_point(0, 40)
#     user.power_momentum_scroll_up()
#     user.power_momentum_start(ts, 2.0)
# parrot(fff:repeat):
#     user.power_momentum_add(ts, power)
# parrot(fff:stop):
#     user.power_momentum_decaying()

# scroll start: '"scroll start": Function(lambda: scroller.start()),'()
# [scroll] stop: '"[scroll] stop": Function(lambda: scroller.stop()),'()
# scroll reset: '"scroll reset": Function(lambda: reset_scroller()),'()

ocr show [text]: user.show_ocr_overlay("text", 1)
ocr show boxes: user.show_ocr_overlay("boxes", 1)
(hover (seen | scene) | cursor move) <user.timestamped_prose>$: user.move_cursor_to_word(timestamped_prose)
[left] (touch | click) <user.timestamped_prose>$:
    user.click_text(timestamped_prose)
[left] double (touch | click) <user.timestamped_prose>$:
    user.double_click_text(timestamped_prose)
right (touch | click) <user.timestamped_prose>$:
    user.right_click_text(timestamped_prose)
middle (touch | click) <user.timestamped_prose>$:
    user.middle_click_text(timestamped_prose)
<user.modifiers> (touch | click) <user.timestamped_prose>$:
    user.modifier_click_text(modifiers, timestamped_prose)
(go before | pre (seen | scene)) <user.timestamped_prose>$: user.move_text_cursor_to_word(timestamped_prose, "before")
(go after | post (seen | scene)) <user.timestamped_prose>$: user.move_text_cursor_to_word(timestamped_prose, "after")
select <user.prose_range>$:
    user.perform_ocr_action("select", "", prose_range)
{user.ocr_actions} [{user.ocr_modifiers}] (seen | scene) <user.prose_range>$:
    user.perform_ocr_action(ocr_actions, ocr_modifiers or "", prose_range)
replace [{user.ocr_modifiers}] [seen | scene] <user.prose_range> with <user.prose>$:
    user.replace_text(ocr_modifiers or "", prose_range, prose)
[go] before <user.timestamped_prose> say <user.prose>$:
    user.insert_adjacent_to_text(timestamped_prose, "before", prose)
[go] after <user.timestamped_prose> say <user.prose>$:
    user.insert_adjacent_to_text(timestamped_prose, "after", prose)
phones (seen | scene) <user.timestamped_prose>$:
    user.change_text_homophone(timestamped_prose)
