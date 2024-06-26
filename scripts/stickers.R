library(hexSticker)
library(magick)

# magi for at lade magick fjerne baggrund

make_transparent <- function(sti, fuzz = 50){
  
  p <- image_read(sti)
  p %>% 
    image_fill(color = "transparent", refcolor = "white", fuzz = fuzz, point = "+1+1") %>%
    image_fill(color = "transparent", refcolor = "white", fuzz = fuzz, point = paste0("+", image_info(p)$width-1, "+1")) %>%
    image_fill(color = "transparent", refcolor = "white", fuzz = fuzz, point = paste0("+1", "+", image_info(p)$height-1)) %>%
    image_fill(color = "transparent", refcolor = "white", fuzz = fuzz, point = paste0("+", image_info(p)$width-1, "+", image_info(p)$height-1)) %>% 
  image_write(path = sti)
}

# LogistiCore
imgurl <- "img/org/LogistiCore.webp"
hexSticker::sticker(imgurl, package = "", 
                    p_color =  "black",
                    p_y = 1.6,
                    h_fill = "white",
                    h_color = "orange",
                    s_x = 1.0,
                    s_y = 1.0,
                    s_width = 1,
                    url = "LogistiCore",
                    u_color = "orange",
                    u_size = 11,
                    u_x = 0.95,
                    u_y = 0.11,
            #        u_angle = 45,
                    white_around_sticker = TRUE,
                    filename = "img/LogistiCore.png")
make_transparent("img/LogistiCore.png", fuzz = 20)

# proclaim
imgurl <- "img/org/proclaim.webp"
hexSticker::sticker(imgurl, package = "", 
                    p_color =  "black",
                    p_y = 1.6,
                    h_fill = "white",
                    h_color = "aquamarine",
                    s_x = 1.0,
                    s_y = 1.0,
                    s_width = 1,
                    url = "proclaim",
                    u_color = "aquamarine",
                    u_size = 12,
                    u_x = 1.74,
                    u_y = 0.55,
                    u_angle = 90,
                    white_around_sticker = TRUE,
                    filename = "img/proclaim.png")
make_transparent("img/proclaim.png", fuzz = 20)


# roman numeral converter

imgurl <- "img/org/ionic_column.png"
hexSticker::sticker(imgurl, package = "", 
                    p_color =  "purple",
                    p_y = 1.6,
                    h_fill = "white",
                    h_color = "purple",
                    s_x = 1.0,
                    s_y = 1.0,
                    s_width = 1,
                    url = "             roman",
                    u_color = "purple",
                    u_size = 12,
                    u_x = 0.95,
                    u_y = 0.11,
                    white_around_sticker = TRUE,
                    filename = "img/roman.png")
make_transparent("img/roman.png")



# The Final Countdown

imgurl <- "img/org/TFCD.webp"
hexSticker::sticker(imgurl, package = "", 
                    p_color =  "green",
                    p_y = 1.6,
                    h_fill = "black",
                    h_color = "green",
                    s_x = 1.0,
                    s_y = 1.0,
                    s_width = 1,
                    url = "  TFCD",
                    u_color = "green",
                    u_size = 12,
                    u_x = 0.95,
                    u_y = 0.11,
                    white_around_sticker = TRUE,
                    filename = "img/TFCD.png")
make_transparent("img/TFCD.png")

# euler
imgurl <- "img/org/euler.webp"
hexSticker::sticker(imgurl, package = "", 
                    p_color =  "blue",
                    p_y = 1.6,
                    h_fill = "black",
                    h_color = "blue",
                    s_x = 1.0,
                    s_y = 1.0,
                    s_width = 1,
                    url = "  euler",
                    u_color = "blue",
                    u_size = 12,
                    u_x = 0.95,
                    u_y = 0.11,
                    white_around_sticker = TRUE,
                    filename = "img/euler.png")


# Min egen pakke
imgurl <- "img/org/KnudsenKit-transp.png"
hexSticker::sticker(imgurl, package = "", 
                    p_color =  "orange",
                    p_y = 1.6,
                    h_fill = "black",
                    h_color = "orange",
                    s_x = 1.0,
                    s_y = 1.0,
                    s_width = 1,
                    url = "  KnudsenKit",
                    u_color = "orange",
                    u_size = 12,
                    u_x = 0.95,
                    u_y = 0.11,
                    filename = "img/KnudsenKit.png")
