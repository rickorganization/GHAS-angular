import { enableProdMode } from '@angular/core';
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';

import { AppModule } from './app/app.module';
import { environment } from './environments/environment';

if (environment.production) {
  enableProdMode();
}
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
platformBrowserDynamic().bootstrapModule(AppModule)
  .catch(err => console.error(err));
