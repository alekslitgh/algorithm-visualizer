import { Module } from '@nestjs/common';
import { UserModule } from './modules/user/user.module';
import { AuthModule } from './modules/auth/auth.module';
import { AlgoModule } from './modules/algo/algo.module';
import { PrismaModule } from './modules/prisma/prisma.module';

@Module({
  imports: [UserModule, AuthModule, AlgoModule, PrismaModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
