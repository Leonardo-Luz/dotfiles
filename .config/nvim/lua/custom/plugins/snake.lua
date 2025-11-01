return {
  {
    'leonardo-luz/snake.nvim',
    dependencies = {
      {
        'leonardo-luz/floatwindow.nvim',
        'nvim-lua/plenary.nvim',
      },
    },
    opts = {
      wall_collision = false,
      speed = 100,
      map_size = {
        x = 44,
        y = 22,
      },
      max_foods = 5,
      spawn_rate = 5,
      highscore_persistence = true,
      visual = {
        head = {
          "^",
          ">",
          "v",
          "<"
        },
        body = "*",
        food = "x",
        start_pos = "o",
        wall = "#",
        background = ".",
      }
    }
  }
}
