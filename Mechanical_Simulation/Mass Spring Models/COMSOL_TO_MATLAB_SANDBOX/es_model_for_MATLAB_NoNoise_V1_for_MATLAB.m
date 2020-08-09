function out = model

% es_model_for_MATLAB_NoNoise_V1_for_MATLAB.m

% Model exported on Aug 7 2020, 22:06 by COMSOL 5.5.0.359.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Users\Bruno\Documents\DISSERTATION\Mechanical_Simulation\Mass Spring Models\11_NewESModel\COMSOL files\ES_Good');

model.label('es_model_for_MATLAB_NoNoise_V1_for_MATLAB.mph');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.result.table.create('evl2', 'Table');
model.result.evaluationGroup.create('eg1', 'EvaluationGroup');
model.result.evaluationGroup('eg1').create('int1', 'IntLine');

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('pol1').set('type', 'open');
model.component('comp1').geom('geom1').feature('pol1').set('source', 'table'); 
model.component('comp1').geom('geom1').feature('pol1').set('table', {'0' '0.00E+00';  ...
'4.47921E-08' '-1.82E-14';  ...
'8.95841E-08' '-7.28E-14';  ...
'1.34376E-07' '-1.64E-13';  ...
'1.79168E-07' '-2.91E-13';  ...
'2.2396E-07' '-4.55E-13';  ...
'2.68752E-07' '-6.55E-13';  ...
'3.13544E-07' '-8.91E-13';  ...
'3.58337E-07' '-1.16E-12';  ...
'4.03129E-07' '-1.47E-12';  ...
'4.47921E-07' '-1.82E-12';  ...
'8.95841E-07' '-7.28E-12';  ...
'1.34376E-06' '-1.64E-11';  ...
'1.79168E-06' '-2.91E-11';  ...
'2.2396E-06' '-4.55E-11';  ...
'2.68752E-06' '-6.55E-11';  ...
'3.13544E-06' '-8.91E-11';  ...
'3.58336E-06' '-1.16E-10';  ...
'4.03128E-06' '-1.47E-10';  ...
'4.4792E-06' '-1.82E-10';  ...
'8.95837E-06' '-7.28E-10';  ...
'1.34375E-05' '-1.64E-09';  ...
'1.79167E-05' '-2.91E-09';  ...
'2.23958E-05' '-4.55E-09';  ...
'2.68749E-05' '-6.55E-09';  ...
'3.13539E-05' '-8.91E-09';  ...
'3.5833E-05' '-1.16E-08';  ...
'4.0312E-05' '-1.47E-08';  ...
'4.4791E-05' '-1.82E-08';  ...
'8.95798E-05' '-7.27E-08';  ...
'0.000134367' '-1.63E-07';  ...
'0.000179151' '-2.90E-07';  ...
'0.000223933' '-4.53E-07';  ...
'0.000268714' '-6.52E-07';  ...
'0.000313492' '-8.87E-07';  ...
'0.000358268' '-1.16E-06';  ...
'0.000403042' '-1.46E-06';  ...
'0.000447814' '-1.81E-06';  ...
'0.000895416' '-7.18E-06';  ...
'0.001342811' '-1.60E-05';  ...
'0.001790003' '-2.83E-05';  ...
'0.002236997' '-4.40E-05';  ...
'0.002683796' '-6.29E-05';  ...
'0.003130406' '-8.50E-05';  ...
'0.00357683' '-1.10E-04';  ...
'0.004023072' '-1.39E-04';  ...
'0.004469138' '-1.70E-04';  ...
'0.008921007' '-6.31E-04';  ...
'0.013359912' '-1.31E-03';  ...
'0.017790158' '-2.14E-03';  ...
'0.02221605' '-3.04E-03';  ...
'0.026641894' '-3.94E-03';  ...
'0.031071995' '-4.77E-03';  ...
'0.035510657' '-5.46E-03';  ...
'0.039962186' '-5.93E-03';  ...
'0.044430887' '-0.006115478'});
model.component('comp1').geom('geom1').create('copy3', 'Copy');
model.component('comp1').geom('geom1').feature('copy3').set('disply', '-1e-4');
model.component('comp1').geom('geom1').feature('copy3').selection('input').set({'pol1'});
model.component('comp1').geom('geom1').create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('r2').set('pos', [-0.01 -1.0E-4]);
model.component('comp1').geom('geom1').feature('r2').set('type', 'curve');
model.component('comp1').geom('geom1').feature('r2').set('size', [0.01 1.0E-4]);
model.component('comp1').geom('geom1').create('r3', 'Rectangle');
model.component('comp1').geom('geom1').feature('r3').set('pos', [0.044430887 -0.006215478]);
model.component('comp1').geom('geom1').feature('r3').set('type', 'curve');
model.component('comp1').geom('geom1').feature('r3').set('size', [0.005 1.0E-4]);
model.component('comp1').geom('geom1').create('uni3', 'Union');
model.component('comp1').geom('geom1').feature('uni3').selection('input').set({'copy3' 'pol1' 'r2' 'r3'});
model.component('comp1').geom('geom1').create('csol1', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol1').selection('input').set({'uni3'});
model.component('comp1').geom('geom1').create('copy1', 'Copy');
model.component('comp1').geom('geom1').feature('copy1').set('disply', '1e-4+0.0e-5');
model.component('comp1').geom('geom1').feature('copy1').selection('input').set({'csol1'});
model.component('comp1').geom('geom1').create('copy4', 'Copy');
model.component('comp1').geom('geom1').feature('copy4').set('disply', '1e-4+1E-4');
model.component('comp1').geom('geom1').feature('copy4').selection('input').set({'csol1'});
model.component('comp1').geom('geom1').create('uni2', 'Union');
model.component('comp1').geom('geom1').feature('uni2').set('intbnd', false);
model.component('comp1').geom('geom1').feature('uni2').selection('input').set({'copy1' 'copy4'});
model.component('comp1').geom('geom1').create('copy2', 'Copy');
model.component('comp1').geom('geom1').feature('copy2').set('disply', '1e-4+130E-6');
model.component('comp1').geom('geom1').feature('copy2').selection('input').set({'csol1'});
model.component('comp1').geom('geom1').create('dif1', 'Difference');
model.component('comp1').geom('geom1').feature('dif1').set('intbnd', false);
model.component('comp1').geom('geom1').feature('dif1').selection('input').set({'uni2'});
model.component('comp1').geom('geom1').feature('dif1').selection('input2').set({'copy2'});
model.component('comp1').geom('geom1').create('mir2', 'Mirror');
model.component('comp1').geom('geom1').feature('mir2').set('keep', true);
model.component('comp1').geom('geom1').feature('mir2').set('pos', [0.049430887 0]);
model.component('comp1').geom('geom1').feature('mir2').set('axis', [1 0]);
model.component('comp1').geom('geom1').feature('mir2').selection('input').set({'csol1' 'dif1'});
model.component('comp1').geom('geom1').create('uni1', 'Union');
model.component('comp1').geom('geom1').feature('uni1').set('intbnd', false);
model.component('comp1').geom('geom1').feature('uni1').selection('input').set({'csol1' 'mir2(1)'});
model.component('comp1').geom('geom1').create('uni4', 'Union');
model.component('comp1').geom('geom1').feature('uni4').set('intbnd', false);
model.component('comp1').geom('geom1').feature('uni4').selection('input').set({'dif1' 'mir2(2)'});
model.component('comp1').geom('geom1').create('mir3', 'Mirror');
model.component('comp1').geom('geom1').feature('mir3').set('keep', true);
model.component('comp1').geom('geom1').feature('mir3').set('pos', {'0' '130E-6+1E-7'});
model.component('comp1').geom('geom1').feature('mir3').set('axis', [0 1]);
model.component('comp1').geom('geom1').feature('mir3').selection('input').set({'uni1' 'uni4'});
model.component('comp1').geom('geom1').create('r4', 'Rectangle');
model.component('comp1').geom('geom1').feature('r4').set('pos', {'-.1' '-.1'});
model.component('comp1').geom('geom1').feature('r4').set('size', [0.3 0.2]);
model.component('comp1').geom('geom1').run;

model.component('comp1').selection.create('sel6', 'Explicit');
model.component('comp1').selection('sel6').geom('geom1', 2, 1, {'exterior' 'interior'});
model.component('comp1').selection('sel6').set([5]);
model.component('comp1').selection.create('sel7', 'Explicit');
model.component('comp1').selection('sel7').geom('geom1', 2, 1, {'exterior' 'interior'});
model.component('comp1').selection('sel7').set([2]);
model.component('comp1').selection.create('sel2', 'Explicit');
model.component('comp1').selection('sel2').set([3 4]);
model.component('comp1').selection.create('sel4', 'Explicit');
model.component('comp1').selection('sel4').set([0 1 3 4 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44]);
model.component('comp1').selection.create('sel5', 'Explicit');
model.component('comp1').selection('sel5').geom('geom1', 1);
model.component('comp1').selection.create('sel8', 'Explicit');
model.component('comp1').selection('sel8').geom('geom1', 1);
model.component('comp1').selection('sel8').set([7 19 38 44 50 56 62 68 74 80 86 92 98 104 110 116 122 128 134 140 146 152 158 164 170 176 182 188 194 200 206 212 218 224 230 236 242 248 254 260 266 272 278 284 290 296 302 308 314 320 326 332 338 344 350 356 362 368 374 380 386 392 398 404 410 416 422 428 434 440 446 452 458 464 470 476 482 488 494 500 506 512 518 524 530 536 542 548 554 560 566 572 578 597]);
model.component('comp1').selection.create('sel9', 'Explicit');
model.component('comp1').selection('sel9').geom('geom1', 1);
model.component('comp1').selection('sel9').set([13 22 41 47 53 59 65 71 77 83 89 95 101 107 113 119 125 131 137 143 149 155 161 167 173 179 185 191 197 203 209 215 221 227 233 239 245 251 257 263 269 275 281 287 293 299 305 311 317 323 329 335 341 347 353 359 365 371 377 383 389 395 401 407 413 419 425 431 437 443 449 455 461 467 473 479 485 491 497 503 509 515 521 527 533 539 545 551 557 563 569 575 581 599]);
model.component('comp1').selection.create('sel10', 'Explicit');
model.component('comp1').selection('sel10').geom('geom1', 1);
model.component('comp1').selection('sel10').set([5 15 16 17 18 27 28 29 30 31 37 43 49 55 61 67 73 79 85 91 97 103 109 115 121 127 133 139 145 151 157 163 169 175 181 187 193 199 205 211 217 223 229 235 241 247 253 259 265 271 277 283 289 295 301 307 313 319 325 331 337 343 349 355 361 367 373 379 385 391 397 403 409 415 421 427 433 439 445 451 457 463 469 475 481 487 493 499 505 511 517 523 529 535 541 547 553 559 565 571 577 583 584 585 586 587 593 594 595 596]);
model.component('comp1').selection.create('sel11', 'Explicit');
model.component('comp1').selection('sel11').geom('geom1', 1);
model.component('comp1').selection('sel11').set([14 23 24 25 26 32 33 34 35 36 42 48 54 60 66 72 78 84 90 96 102 108 114 120 126 132 138 144 150 156 162 168 174 180 186 192 198 204 210 216 222 228 234 240 246 252 258 264 270 276 282 288 294 300 306 312 318 324 330 336 342 348 354 360 366 372 378 384 390 396 402 408 414 420 426 432 438 444 450 456 462 468 474 480 486 492 498 504 510 516 522 528 534 540 546 552 558 564 570 576 582 588 589 590 591 592 600 601 602 603]);
model.component('comp1').selection.create('sel12', 'Explicit');
model.component('comp1').selection('sel12').geom('geom1', 1);
model.component('comp1').selection('sel12').set([20 39 45 51 57 63 69 75 81 87 93 99 105 111 117 123 129 135 141 147 153 159 165 171 177 183 189 195 201 207 213 219 225 231 237 243 249 255 261 267 273 279 285 291 297 303 309 315 321 327 333 339 345 351 357 363 369 375 381 387 393 399 405 411 417 423 429 435 441 447 453 459 465 471 477 483 489 495 501 507 513 519 525 531 537 543 549 555 561 567 573 579]);
model.component('comp1').selection.create('sel13', 'Explicit');
model.component('comp1').selection('sel13').geom('geom1', 1);
model.component('comp1').selection('sel13').set([21 40 46 52 58 64 70 76 82 88 94 100 106 112 118 124 130 136 142 148 154 160 166 172 178 184 190 196 202 208 214 220 226 232 238 244 250 256 262 268 274 280 286 292 298 304 310 316 322 328 334 340 346 352 358 364 370 376 382 388 394 400 406 412 418 424 430 436 442 448 454 460 466 472 478 484 490 496 502 508 514 520 526 532 538 544 550 556 562 568 574 580]);
model.component('comp1').selection.create('sel15', 'Explicit');
model.component('comp1').selection('sel15').geom('geom1', 1);
model.component('comp1').selection('sel15').set([4 5 6 7 8 9 11 12 13 14 596 597 599 601 604 605 606 607 608 609]);
model.component('comp1').selection.create('dif1', 'Difference');
model.component('comp1').selection('dif1').set('entitydim', 1);
model.component('comp1').selection.create('dif2', 'Difference');
model.component('comp1').selection('dif2').set('entitydim', 1);
model.component('comp1').selection.create('dif3', 'Difference');
model.component('comp1').selection('dif3').set('entitydim', 1);
model.component('comp1').selection.create('dif4', 'Difference');
model.component('comp1').selection('dif4').set('entitydim', 1);
model.component('comp1').selection.create('dif5', 'Difference');
model.component('comp1').selection('dif5').set('entitydim', 1);
model.component('comp1').selection.create('dif6', 'Difference');
model.component('comp1').selection('dif6').set('entitydim', 1);
model.component('comp1').selection.create('sel16', 'Explicit');
model.component('comp1').selection('sel16').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel16').set([2 5]);
model.component('comp1').selection.create('sel17', 'Explicit');
model.component('comp1').selection('sel17').geom('geom1', 1);
model.component('comp1').selection.create('dif7', 'Difference');
model.component('comp1').selection('dif7').set('entitydim', 1);
model.component('comp1').selection('sel6').label('top_plate');
model.component('comp1').selection('sel7').label('bottom_plate');
model.component('comp1').selection('sel2').label('insulator');
model.component('comp1').selection('sel4').label('ins+void2');
model.component('comp1').selection('sel5').label('metallic_boundary');
model.component('comp1').selection('sel8').label('bottom_interface_all');
model.component('comp1').selection('sel8').set('groupcontang', true);
model.component('comp1').selection('sel9').label('top_interface_all');
model.component('comp1').selection('sel9').set('groupcontang', true);
model.component('comp1').selection('sel10').label('bottom_exposed_electrode_all');
model.component('comp1').selection('sel10').set('groupcontang', true);
model.component('comp1').selection('sel11').label('top_exposed_electrode_all');
model.component('comp1').selection('sel11').set('groupcontang', true);
model.component('comp1').selection('sel12').label('bottom_exposed_insulator_all');
model.component('comp1').selection('sel12').set('groupcontang', true);
model.component('comp1').selection('sel13').label('top_exposed_insulator_all');
model.component('comp1').selection('sel13').set('groupcontang', true);
model.component('comp1').selection('sel15').label('clip_edges');
model.component('comp1').selection('dif1').label('bottom_interface');
model.component('comp1').selection('dif1').set('add', {'sel8'});
model.component('comp1').selection('dif1').set('subtract', {'sel15'});
model.component('comp1').selection('dif2').label('top_interface');
model.component('comp1').selection('dif2').set('add', {'sel9'});
model.component('comp1').selection('dif2').set('subtract', {'sel15'});
model.component('comp1').selection('dif3').label('bottom_exposed_electrode');
model.component('comp1').selection('dif3').set('add', {'sel10'});
model.component('comp1').selection('dif3').set('subtract', {'sel15'});
model.component('comp1').selection('dif4').label('top_exposed_electrode');
model.component('comp1').selection('dif4').set('add', {'sel11'});
model.component('comp1').selection('dif4').set('subtract', {'sel15'});
model.component('comp1').selection('dif5').label('bottom_exposed_insulator');
model.component('comp1').selection('dif5').set('add', {'sel12'});
model.component('comp1').selection('dif5').set('subtract', {'sel15'});
model.component('comp1').selection('dif6').label('top_exposed_insulator');
model.component('comp1').selection('dif6').set('add', {'sel13'});
model.component('comp1').selection('dif6').set('subtract', {'sel15'});
model.component('comp1').selection('sel16').label('metallic _boundaries');
model.component('comp1').selection('sel17').label('to_subtract');
model.component('comp1').selection('dif7').label('terminal1_bd');
model.component('comp1').selection('dif7').set('add', {'sel16'});
model.component('comp1').selection('dif7').set('subtract', {'sel17'});

model.view.create('view2', 2);
model.view.create('view3', 2);

model.component('comp1').material.create('mat3', 'Common');
model.component('comp1').material.create('mat2', 'Common');
model.component('comp1').material.create('mat4', 'Common');
model.component('comp1').material('mat3').selection.set([0 1 3 4 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44]);
model.component('comp1').material('mat3').propertyGroup('def').func.create('eta', 'Piecewise');
model.component('comp1').material('mat3').propertyGroup('def').func.create('Cp', 'Piecewise');
model.component('comp1').material('mat3').propertyGroup('def').func.create('rho', 'Piecewise');
model.component('comp1').material('mat3').propertyGroup('def').func.create('k', 'Piecewise');
model.component('comp1').material('mat2').selection.set([2 5]);
model.component('comp1').material('mat2').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat4').selection.set([3 4]);
model.component('comp1').material('mat4').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');

model.component('comp1').physics.create('es', 'Electrostatics', 'geom1');
model.component('comp1').physics('es').field('electricpotential').field('V2');
model.component('comp1').physics('es').selection.set([1 3 4 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44]);
model.component('comp1').physics('es').create('ccn2', 'ChargeConservation', 2);
model.component('comp1').physics('es').feature('ccn2').selection.set([3 4]);
model.component('comp1').physics('es').create('term1', 'DomainTerminal', 2);
model.component('comp1').physics('es').feature('term1').selection.set([5]);
model.component('comp1').physics('es').create('term2', 'DomainTerminal', 2);
model.component('comp1').physics('es').feature('term2').selection.set([2]);
model.component('comp1').physics('es').create('term3', 'Terminal', 1);
model.component('comp1').physics('es').feature('term3').selection.named('sel7');
model.component('comp1').physics('es').create('term4', 'Terminal', 1);
model.component('comp1').physics('es').feature('term4').selection.named('sel6');

model.component('comp1').mesh('mesh1').create('ftri1', 'FreeTri');
model.component('comp1').mesh('mesh1').create('ftri2', 'FreeTri');
model.component('comp1').mesh('mesh1').create('fq1', 'FreeQuad');
model.component('comp1').mesh('mesh1').feature('ftri1').selection.geom('geom1', 2);
model.component('comp1').mesh('mesh1').feature('ftri1').selection.set([25]);
model.component('comp1').mesh('mesh1').feature('ftri2').selection.geom('geom1', 2);
model.component('comp1').mesh('mesh1').feature('ftri2').selection.set([3 4]);

model.result.table('evl2').label('Evaluation 2D');
model.result.table('evl2').comments('Interactive 2D values');

model.component('comp1').view('view1').axis.set('xmin', 0.058561697602272034);
model.component('comp1').view('view1').axis.set('xmax', 0.0896071121096611);
model.component('comp1').view('view1').axis.set('ymin', -0.020082393661141396);
model.component('comp1').view('view1').axis.set('ymax', 0.01298041082918644);
model.view('view2').axis.set('xmin', -0.0488400012254715);
model.view('view2').axis.set('xmax', 0.11044000089168549);
model.view('view2').axis.set('ymin', -0.09553901851177216);
model.view('view2').axis.set('ymax', 0.07948900759220123);
model.view('view3').axis.set('xmin', -0.011018949560821056);
model.view('view3').axis.set('xmax', 0.007674585096538067);
model.view('view3').axis.set('ymin', -0.008579621091485023);
model.view('view3').axis.set('ymax', 0.003405548632144928);

model.component('comp1').material('mat3').label('Transformer oil');
model.component('comp1').material('mat3').propertyGroup('def').func('eta').set('arg', 'T');
model.component('comp1').material('mat3').propertyGroup('def').func('eta').set('pieces', {'243.0' '273.0' '4492.20229-64.7408879*T^1+0.349900959*T^2-8.40477E-4*T^3+7.57041667E-7*T^4'; '273.0' '373.0' '91.4524999-1.33227058*T^1+0.00777680216*T^2-2.27271368E-5*T^3+3.32419673E-8*T^4-1.94631023E-11*T^5'});
model.component('comp1').material('mat3').propertyGroup('def').func('eta').set('argunit', 'K');
model.component('comp1').material('mat3').propertyGroup('def').func('eta').set('fununit', 'Pa*s');
model.component('comp1').material('mat3').propertyGroup('def').func('Cp').set('arg', 'T');
model.component('comp1').material('mat3').propertyGroup('def').func('Cp').set('pieces', {'223.0' '293.0' '-117056.38+1816.76208*T^1-10.305786*T^2+0.0256691919*T^3-2.36742424E-5*T^4'; '293.0' '373.0' '-13408.1491+123.044152*T^1-0.335401786*T^2+3.125E-4*T^3'});
model.component('comp1').material('mat3').propertyGroup('def').func('Cp').set('argunit', 'K');
model.component('comp1').material('mat3').propertyGroup('def').func('Cp').set('fununit', 'J/(kg*K)');
model.component('comp1').material('mat3').propertyGroup('def').func('rho').set('arg', 'T');
model.component('comp1').material('mat3').propertyGroup('def').func('rho').set('pieces', {'223.0' '373.0' '1055.04607-0.581753034*T^1-6.40531689E-5*T^2'});
model.component('comp1').material('mat3').propertyGroup('def').func('rho').set('argunit', 'K');
model.component('comp1').material('mat3').propertyGroup('def').func('rho').set('fununit', 'kg/m^3');
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('arg', 'T');
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('pieces', {'223.0' '373.0' '0.134299084-8.04973822E-5*T^1'});
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('argunit', 'K');
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('fununit', 'W/(m*K)');
model.component('comp1').material('mat3').propertyGroup('def').set('dynamicviscosity', 'eta(T)');
model.component('comp1').material('mat3').propertyGroup('def').descr('dynamicviscosity_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('heatcapacity', 'Cp(T)');
model.component('comp1').material('mat3').propertyGroup('def').descr('heatcapacity_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('density', 'rho(T)');
model.component('comp1').material('mat3').propertyGroup('def').descr('density_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('thermalconductivity', {'k(T)' '0' '0' '0' 'k(T)' '0' '0' '0' 'k(T)'});
model.component('comp1').material('mat3').propertyGroup('def').descr('thermalconductivity_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('relpermittivity', {'2.7' '0' '0' '0' '2.7' '0' '0' '0' '2.7'});
model.component('comp1').material('mat3').propertyGroup('def').set('relpermittivity_symmetry', '0');
model.component('comp1').material('mat3').propertyGroup('def').addInput('temperature');
model.component('comp1').material('mat2').label('Steel AISI 4340');
model.component('comp1').material('mat2').set('family', 'steel');
model.component('comp1').material('mat2').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat2').propertyGroup('def').descr('relpermeability_symmetry', '');
model.component('comp1').material('mat2').propertyGroup('def').set('electricconductivity', {'4.032e6[S/m]' '0' '0' '0' '4.032e6[S/m]' '0' '0' '0' '4.032e6[S/m]'});
model.component('comp1').material('mat2').propertyGroup('def').descr('electricconductivity_symmetry', '');
model.component('comp1').material('mat2').propertyGroup('def').set('thermalexpansioncoefficient', {'12.3e-6[1/K]' '0' '0' '0' '12.3e-6[1/K]' '0' '0' '0' '12.3e-6[1/K]'});
model.component('comp1').material('mat2').propertyGroup('def').descr('thermalexpansioncoefficient_symmetry', '');
model.component('comp1').material('mat2').propertyGroup('def').set('heatcapacity', '475[J/(kg*K)]');
model.component('comp1').material('mat2').propertyGroup('def').descr('heatcapacity_symmetry', '');
model.component('comp1').material('mat2').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat2').propertyGroup('def').descr('relpermittivity_symmetry', '');
model.component('comp1').material('mat2').propertyGroup('def').set('density', '7850[kg/m^3]');
model.component('comp1').material('mat2').propertyGroup('def').descr('density_symmetry', '');
model.component('comp1').material('mat2').propertyGroup('def').set('thermalconductivity', {'44.5[W/(m*K)]' '0' '0' '0' '44.5[W/(m*K)]' '0' '0' '0' '44.5[W/(m*K)]'});
model.component('comp1').material('mat2').propertyGroup('def').descr('thermalconductivity_symmetry', '');
model.component('comp1').material('mat2').propertyGroup('Enu').set('youngsmodulus', '205e9[Pa]');
model.component('comp1').material('mat2').propertyGroup('Enu').descr('youngsmodulus_symmetry', '');
model.component('comp1').material('mat2').propertyGroup('Enu').set('poissonsratio', '0.28');
model.component('comp1').material('mat2').propertyGroup('Enu').descr('poissonsratio_symmetry', '');
model.component('comp1').material('mat4').label('PVC - Polyvinyl chloride');
model.component('comp1').material('mat4').propertyGroup('def').set('thermalexpansioncoefficient', {'100e-6[1/K]' '0' '0' '0' '100e-6[1/K]' '0' '0' '0' '100e-6[1/K]'});
model.component('comp1').material('mat4').propertyGroup('def').descr('thermalexpansioncoefficient_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').set('relpermittivity', {'4.6' '0' '0' '0' '4.6' '0' '0' '0' '4.6'});
model.component('comp1').material('mat4').propertyGroup('def').set('relpermittivity_symmetry', '0');
model.component('comp1').material('mat4').propertyGroup('def').descr('relpermittivity_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').set('density', '1760[kg/m^3]');
model.component('comp1').material('mat4').propertyGroup('def').descr('density_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').set('thermalconductivity', {'0.1[W/(m*K)]' '0' '0' '0' '0.1[W/(m*K)]' '0' '0' '0' '0.1[W/(m*K)]'});
model.component('comp1').material('mat4').propertyGroup('def').descr('thermalconductivity_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('Enu').set('youngsmodulus', '2.9e9[Pa]');
model.component('comp1').material('mat4').propertyGroup('Enu').descr('youngsmodulus_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('Enu').descr('poissonsratio_symmetry', '');

model.component('comp1').physics('es').prop('d').set('d', 0.0127);
model.component('comp1').physics('es').feature('term1').set('TerminalType', 'Voltage');
model.component('comp1').physics('es').feature('term1').set('V0', 10000);
model.component('comp1').physics('es').feature('term1').active(false);
model.component('comp1').physics('es').feature('term2').set('TerminalType', 'Voltage');
model.component('comp1').physics('es').feature('term2').set('V0', -10000);
model.component('comp1').physics('es').feature('term2').active(false);
model.component('comp1').physics('es').feature('term3').set('TerminalType', 'Voltage');
model.component('comp1').physics('es').feature('term3').set('V0', 6000);
model.component('comp1').physics('es').feature('term4').set('TerminalType', 'Voltage');
model.component('comp1').physics('es').feature('term4').set('V0', -6000);

model.component('comp1').mesh('mesh1').feature('fq1').active(false);
model.component('comp1').mesh('mesh1').run;

model.study.create('std2');
model.study('std2').create('stat', 'Stationary');

model.sol.create('sol1');
model.sol('sol1').study('std2');
model.sol('sol1').attach('std2');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature.remove('fcDef');

model.result.create('pg1', 'PlotGroup2D');
model.result.create('pg2', 'PlotGroup1D');
model.result.create('pg3', 'PlotGroup1D');
model.result('pg1').create('surf1', 'Surface');
model.result('pg2').create('lngr1', 'LineGraph');
model.result('pg2').create('lngr2', 'LineGraph');
model.result('pg2').create('lngr3', 'LineGraph');
model.result('pg2').feature('lngr1').selection.named('sel13');
model.result('pg2').feature('lngr1').set('expr', 'es.nD');
model.result('pg2').feature('lngr2').selection.named('sel13');
model.result('pg2').feature('lngr2').set('expr', 'es.Ey');
model.result('pg2').feature('lngr3').selection.named('sel13');
model.result('pg2').feature('lngr3').set('expr', 'es.unTx');
model.result('pg3').create('lngr1', 'LineGraph');
model.result('pg3').create('lngr2', 'LineGraph');
model.result('pg3').create('lngr3', 'LineGraph');
model.result('pg3').feature('lngr1').selection.named('dif2');
model.result('pg3').feature('lngr1').set('expr', 'es.nD');
model.result('pg3').feature('lngr2').selection.named('sel9');
model.result('pg3').feature('lngr2').set('expr', 'es.Ey');
model.result('pg3').feature('lngr3').selection.named('dif2');
model.result('pg3').feature('lngr3').set('expr', 'es.Ey^2*epsilon0_const*es.d');
model.result.export.create('plot1', 'Plot');
model.result.export.create('plot2', 'Plot');
model.result.export.create('plot3', 'Plot');

model.sol('sol1').attach('std2');
model.sol('sol1').runAll;

model.result.evaluationGroup('eg1').set('data', 'dset1');
model.result.evaluationGroup('eg1').feature('int1').set('expr', {'es.Ey^2*epsilon0_const*es.d'});
model.result.evaluationGroup('eg1').feature('int1').set('unit', {'N'});
model.result.evaluationGroup('eg1').feature('int1').set('descr', {''});
model.result.evaluationGroup('eg1').feature('int1').selection.named('dif2');
model.result.evaluationGroup('eg1').run;
model.result('pg1').label('Electric Potential (es)');
model.result('pg1').set('frametype', 'spatial');
model.result('pg1').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result('pg2').label('top_insulator');
model.result('pg2').set('xlabel', 'Arc length (m)');
model.result('pg2').set('xlabelactive', false);
model.result('pg2').feature('lngr1').label('es.nD');
model.result('pg2').feature('lngr1').set('resolution', 'normal');
model.result('pg2').feature('lngr2').label('es.Ey');
model.result('pg2').feature('lngr2').set('resolution', 'normal');
model.result('pg2').feature('lngr3').active(false);
model.result('pg2').feature('lngr3').label('es.Ey 1');
model.result('pg2').feature('lngr3').set('resolution', 'normal');
model.result('pg3').label('interface');
model.result('pg3').set('xlabel', 'Arc length (m)');
model.result('pg3').set('yseclabel', 'Surface charge density (C/m<sup>2</sup>)');
model.result('pg3').set('twoyaxes', true);
model.result('pg3').set('plotonsecyaxis', {'es.nD' 'on' 'lngr1'; 'es.Ey' 'off' 'lngr2'; 'Force' 'off' 'lngr3'});
model.result('pg3').set('xlabelactive', false);
model.result('pg3').set('yseclabelactive', false);
model.result('pg3').feature('lngr1').label('es.nD');
model.result('pg3').feature('lngr1').set('resolution', 'normal');
model.result('pg3').feature('lngr2').label('es.Ey');
model.result('pg3').feature('lngr2').set('resolution', 'normal');
model.result('pg3').feature('lngr3').label('Force');
model.result('pg3').feature('lngr3').set('resolution', 'normal');
model.result.export('plot1').set('plotgroup', 'pg3');
model.result.export('plot1').set('plot', 'lngr3');
model.result.export('plot1').set('filename', 'C:\Users\Bruno\Documents\DISSERTATION\Mechanical_Simulation\Mass Spring Models\11_MATLAB_Control_System\COMSOL files\ES_Good\Fy_interface_V3.csv');
model.result.export('plot1').set('alwaysask', true);
model.result.export('plot2').set('plotgroup', 'pg3');
model.result.export('plot2').set('plot', 'lngr1');
model.result.export('plot2').set('filename', 'C:\Users\Bruno\Documents\DISSERTATION\Mechanical_Simulation\Mass Spring Models\11_MATLAB_Control_System\COMSOL files\ES_Good\nD_interface_V3.csv');
model.result.export('plot2').set('alwaysask', true);
model.result.export('plot3').set('plotgroup', 'pg3');
model.result.export('plot3').set('plot', 'lngr3');
model.result.export('plot3').set('filename', 'C:\Users\Bruno\Documents\DISSERTATION\Mechanical_Simulation\Mass Spring Models\11_MATLAB_Control_System\COMSOL files\ES_Good\Ey_interface_V3.txt');
model.result.export('plot3').set('alwaysask', true);

out = model;
