import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { AccountsComponent} from './accounts/accounts.component';
import {LoansComponent } from './loans/loans.component';
import {SignupComponent} from './signup/signup.component';
import{LoginComponent} from './login/login.component';
import{OffersComponent} from './offers/offers.component';

const routes: Routes = [
  {path:'home',component:HomeComponent},
  {path:'accounts',component:AccountsComponent},
  {path:'loans',component:LoansComponent},
  {path:'signup',component:SignupComponent},
  {path:'login',component:LoginComponent},
  {path:'offers',component:OffersComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
