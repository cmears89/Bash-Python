import math
import random
import pygame

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
PLAYER_WIDTH = 50
PLAYER_HEIGHT = 40
ENEMY_WIDTH = 40
ENEMY_HEIGHT = 30
BULLET_WIDTH = 5
BULLET_HEIGHT = 20


def is_collision(enemy_x, enemy_y, bullet_x, bullet_y):
    """Return True if the bullet and enemy overlap."""
    distance = math.hypot(enemy_x - bullet_x, enemy_y - bullet_y)
    return distance < 27


def main():
    pygame.init()
    screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
    pygame.display.set_caption("Space Invaders")
    clock = pygame.time.Clock()

    player_x = SCREEN_WIDTH // 2 - PLAYER_WIDTH // 2
    player_y = SCREEN_HEIGHT - PLAYER_HEIGHT - 10
    player_speed = 5

    enemy_speed = 2
    enemies = []
    for _ in range(6):
        enemy_x = random.randint(0, SCREEN_WIDTH - ENEMY_WIDTH)
        enemy_y = random.randint(50, 150)
        enemies.append([enemy_x, enemy_y, enemy_speed])

    bullet_x = 0
    bullet_y = player_y
    bullet_speed = 10
    bullet_state = "ready"  # "ready" or "fire"

    score = 0
    font = pygame.font.Font(None, 36)

    running = True
    while running:
        clock.tick(60)
        screen.fill((0, 0, 0))

        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False

        keys = pygame.key.get_pressed()
        if keys[pygame.K_LEFT]:
            player_x -= player_speed
        if keys[pygame.K_RIGHT]:
            player_x += player_speed
        if keys[pygame.K_SPACE] and bullet_state == "ready":
            bullet_x = player_x + PLAYER_WIDTH // 2 - BULLET_WIDTH // 2
            bullet_y = player_y
            bullet_state = "fire"

        player_x = max(0, min(player_x, SCREEN_WIDTH - PLAYER_WIDTH))

        for enemy in enemies:
            enemy[0] += enemy[2]
            if enemy[0] <= 0 or enemy[0] >= SCREEN_WIDTH - ENEMY_WIDTH:
                enemy[2] *= -1
                enemy[1] += 40

            if bullet_state == "fire":
                if is_collision(enemy[0], enemy[1], bullet_x, bullet_y):
                    bullet_state = "ready"
                    bullet_y = player_y
                    score += 1
                    enemy[0] = random.randint(0, SCREEN_WIDTH - ENEMY_WIDTH)
                    enemy[1] = random.randint(50, 150)

            pygame.draw.rect(
                screen,
                (0, 255, 0),
                pygame.Rect(enemy[0], enemy[1], ENEMY_WIDTH, ENEMY_HEIGHT),
            )

        if bullet_state == "fire":
            pygame.draw.rect(
                screen,
                (255, 255, 0),
                pygame.Rect(bullet_x, bullet_y, BULLET_WIDTH, BULLET_HEIGHT),
            )
            bullet_y -= bullet_speed
            if bullet_y <= 0:
                bullet_state = "ready"

        pygame.draw.rect(
            screen,
            (0, 0, 255),
            pygame.Rect(player_x, player_y, PLAYER_WIDTH, PLAYER_HEIGHT),
        )

        score_text = font.render(f"Score : {score}", True, (255, 255, 255))
        screen.blit(score_text, (10, 10))

        pygame.display.flip()

    pygame.quit()


if __name__ == "__main__":
    main()
