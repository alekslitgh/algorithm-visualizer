-- CreateTable
CREATE TABLE `users` (
    `id` VARCHAR(36) NOT NULL,
    `email` VARCHAR(191) NULL,
    `password_hash` VARCHAR(191) NOT NULL,
    `nickname` VARCHAR(50) NOT NULL,
    `first_name` VARCHAR(191) NULL,
    `last_name` VARCHAR(191) NULL,
    `auth_type` ENUM('EMAIL', 'GOOGLE') NOT NULL DEFAULT 'EMAIL',
    `role` ENUM('USER', 'ADMIN') NOT NULL DEFAULT 'USER',
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `users_email_key`(`email`),
    UNIQUE INDEX `users_nickname_key`(`nickname`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `algorithms` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `description` VARCHAR(2047) NOT NULL,
    `score` INTEGER NOT NULL DEFAULT 0,
    `category` ENUM('SORTING', 'TREE', 'GRAPH') NOT NULL,
    `difficulty` ENUM('EASY', 'MEDIUM', 'HARD') NOT NULL,
    `order` INTEGER NOT NULL,
    `isLocked` BOOLEAN NOT NULL DEFAULT true,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `userId` VARCHAR(36) NULL,

    UNIQUE INDEX `algorithms_name_key`(`name`),
    UNIQUE INDEX `algorithms_order_key`(`order`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_algorithms` (
    `user_id` VARCHAR(191) NOT NULL,
    `algorithm_id` VARCHAR(191) NOT NULL,
    `status` ENUM('NOT_STARTED', 'IN_PROGRESS', 'COMPLETED', 'LOCKED') NOT NULL DEFAULT 'NOT_STARTED',
    `completed_at` DATETIME(3) NULL,
    `score` INTEGER NULL,
    `attempts` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`user_id`, `algorithm_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tokens` (
    `token` VARCHAR(191) NOT NULL,
    `exp` DATETIME(3) NOT NULL,
    `userId` VARCHAR(36) NOT NULL,

    UNIQUE INDEX `tokens_token_key`(`token`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `algorithms` ADD CONSTRAINT `algorithms_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `user_algorithms` ADD CONSTRAINT `user_algorithms_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `user_algorithms` ADD CONSTRAINT `user_algorithms_algorithm_id_fkey` FOREIGN KEY (`algorithm_id`) REFERENCES `algorithms`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tokens` ADD CONSTRAINT `tokens_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
