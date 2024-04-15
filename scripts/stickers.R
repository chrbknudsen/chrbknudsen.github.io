library(hexSticker)
library(magick)

# magi for at lade magick fjerne baggrund

make_transparent <- function(sti){
  fuzz <- 50
  image_read(sti)%>% 
    image_fill(color = "transparent", refcolor = "white", fuzz = fuzz, point = "+1+1") %>%
    image_fill(color = "transparent", refcolor = "white", fuzz = fuzz, point = paste0("+", image_info(p)$width-1, "+1")) %>%
    image_fill(color = "transparent", refcolor = "white", fuzz = fuzz, point = paste0("+1", "+", image_info(p)$height-1)) %>%
    image_fill(color = "transparent", refcolor = "white", fuzz = fuzz, point = paste0("+", image_info(p)$width-1, "+", image_info(p)$height-1)) %>% 
  image_write(path = sti)
}


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
