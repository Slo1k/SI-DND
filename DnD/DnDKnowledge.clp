
;;;======================================================
;;;   Automotive Expert System
;;;
;;;     This expert system diagnoses some simple
;;;     problems with a car.
;;;
;;;     CLIPS Version 6.3 Example
;;;
;;;     For use with the Auto Demo Example
;;;======================================================

;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

;;;pyt1
(defrule powod_gry ""

   (logical (start))

   =>

   (assert (UI-state (display powod_gry_pyt)
                     (relation-asserted powod_gry)
                     (response chce_przezyc_przygode_odp)
                     (valid-answers chce_przezyc_przygode_odp chce_poczuc_sie_specjalnie_odp chce_odgrywac_role_odp))))
   

;;;pyt2                     
(defrule preferowane_rasy1 ""

(logical 
   (or
      (powod_gry chce_odgrywac_role_odp)
      (wyroznia1 nie_wiem_odp)
   ))

=>

   (assert (UI-state (display preferowane_rasy_pyt)
                     (relation-asserted preferowane_rasy)
                     (response klasyczne_odp)
                     (valid-answers klasyczne_odp egzotyczne_odp))))

                     

;;;pyt3
(defrule wyroznia1 ""

	(logical 
      (or
         (powod_gry chce_przezyc_przygode_odp)
         (dark_man tak_odp)
      ))
	
	=>
	
	   (assert (UI-state (display wyroznia1_pyt)
                        (relation-asserted wyroznia1)
                        (response charakter_odp)
                        (valid-answers charakter_odp nie_wiem_odp))))



;;;pyt4
(defrule polowa ""

(logical (czlowiek nuda_odp))

=>

   (assert (UI-state (display polowa_pyt)
                     (relation-asserted polowa)
                     (response potworny_odp)
                     (valid-answers potworny_odp basniowy_odp))))


;;;pyt5
(defrule aniol ""

(logical (aasimar tak_odp))

=>

   (assert (UI-state (display aniol_pyt)
                     (relation-asserted aniol)
                     (response dobry_odp)
                     (valid-answers dobry_odp pyszny_odp upadly_odp))))
                     
                  

;;;pyt6
(defrule wyglad1 ""

(logical 
   (or
      (gigant nie_odp)
      (dziwna nie_odp)
   ))

=>

   (assert (UI-state (display wyglad1_pyt)
                     (relation-asserted wyglad1)
                     (response zwierze_odp)
                     (valid-answers zwierze_odp sobowtor_odp robot_odp aniol_odp podwodne_odp potwor_odp))))



;;;pyt7
(defrule potwor1 ""

(logical (wyglad1 potwor_odp))

=>

   (assert (UI-state (display potwor1_pyt)
                     (relation-asserted potwor1)
                     (response full_odp)
                     (valid-answers full_odp part_odp))))



;;;pyt8
(defrule rozmiar1 ""

(logical (preferowane_rasy klasyczne_odp))

=>

   (assert (UI-state (display rozmiar1_pyt)
                     (relation-asserted rozmiar1)
                     (response maly_odp)
                     (valid-answers maly_odp normal_odp duzy_odp))))



;;;pyt9
(defrule inteligencja ""

(logical (rozmiar1 maly_odp))

=>

   (assert (UI-state (display inteligencja_pyt)
                     (relation-asserted inteligencja)
                     (response stupid_odp)
                     (valid-answers stupid_odp very_stupid_odp funny_odp))))



;;;pyt10
(defrule zwinnosc ""

(logical (niziolek tak_odp))

=>

   (assert (UI-state (display zwinnosc_pyt)
                     (relation-asserted zwinnosc)
                     (response zwinny_odp)
                     (valid-answers zwinny_odp wytrzymaly_odp))))



;;;pyt11
(defrule zamieszkanie ""

(logical (gnom tak_odp))

=>

   (assert (UI-state (display zamieszkanie_pyt)
                     (relation-asserted zamieszkanie)
                     (response las_odp)
                     (valid-answers las_odp gory_odp))))
                  
                  

;;;pyt12
(defrule wyglad2 ""

(logical (rozmiar1 normal_odp))

=>

   (assert (UI-state (display wyglad2_pyt)
                     (relation-asserted wyglad2)
                     (response smukly_odp)
                     (valid-answers smukly_odp niski_odp inne_odp))))



;;;pyt13
(defrule gigant ""

(logical (wyglad2 inne_odp))

=>

   (assert (UI-state (display gigant_pyt)
                     (relation-asserted gigant)
                     (response tak_odp)
                     (valid-answers tak_odp nie_odp))))



;;;pyt14
(defrule wartosci ""

(logical (elf_rule tak_odp))

=>

   (assert (UI-state (display wartosci_pyt)
                     (relation-asserted wartosci)
                     (response magia_odp)
                     (valid-answers magia_odp natura_odp inne_odp))))



;;;pyt15
(defrule elf_cechy ""

(logical (wartosci inne_odp))

=>

   (assert (UI-state (display elf_cechy_pyt)
                     (relation-asserted elf_cechy)
                     (response bardziej_basniowy_odp)
                     (valid-answers bardziej_basniowy_odp syrenka_odp w_polowie_elf_odp mroczny_odp))))



;;;pyt16
(defrule krasnolud_cechy ""

(logical (krasnolud dokladniej_odp))

=>

   (assert (UI-state (display krasnolud_cechy_pyt)
                     (relation-asserted krasnolud_cechy)
                     (response wytrzymaly_kras_odp)
                     (valid-answers wytrzymaly_kras_odp silny_odp mroczny_kras_odp))))



;;;pyt17
(defrule lagodny ""

(logical 
   (or
      (rozmiar1 duzy_odp)
      (gigant tak_odp)
   ))

=>

   (assert (UI-state (display lagodny_pyt)
                     (relation-asserted lagodny)
                     (response lagodny_odp)
                     (valid-answers lagodny_odp sila_fizyczna_odp))))



;;;pyt18
(defrule wyroznia2""

(logical 
   (or
      (powod_gry chce_poczuc_sie_specjalnie_odp)
      (preferowane_rasy egzotyczne_odp)
   ))

=>

   (assert (UI-state (display wyroznia2_pyt)
                     (relation-asserted wyroznia2)
                     (response emo_odp)
                     (valid-answers emo_odp smok_odp original_odp))))



;;;pyt19
(defrule dark_man ""

(logical (wyroznia2 emo_odp))

=>

   (assert (UI-state (display dark_man_pyt)
                     (relation-asserted dark_man)
                     (response tak_odp)
                     (valid-answers tak_odp nie_odp))))



;;;pyt20
(defrule rozmiar2 ""

(logical 
   (or
      (wyroznia2 smok_odp)
      (jaki_gad o_smoku_odp)
   ))

=>

   (assert (UI-state (display rozmiar2_pyt)
                     (relation-asserted rozmiar2)
                     (response maly_odp)
                     (valid-answers maly_odp duzy_odp))))



;;;pyt21
(defrule potwor2 ""

(logical (dark_man nie_odp))

=>

   (assert (UI-state (display potwor2_pyt)
                     (relation-asserted potwor2)
                     (response tak_odp)
                     (valid-answers tak_odp nie_odp))))



;;;pyt22
(defrule cechy1 ""

(logical (cechy2 mroczna_wersja_odp))

=>

   (assert (UI-state (display cechy1_pyt)
                     (relation-asserted cechy1)
                     (response gibki_odp)
                     (valid-answers gibki_odp niemily_odp saint_odp))))



;;;pyt23
(defrule cechy2 ""

(logical (potwor2 nie_odp))

=>

   (assert (UI-state (display cechy2_pyt)
                     (relation-asserted cechy2)
                     (response mroczna_wersja_odp)
                     (valid-answers mroczna_wersja_odp half_monster_odp rogi_odp gad_bez_emocji_odp))))



;;;pyt24
(defrule poczucie_humoru ""

(logical (potwor2 tak_odp))

=>

   (assert (UI-state (display poczucie_humoru_pyt)
                     (relation-asserted poczucie_humoru)
                     (response zabawny_odp)
                     (valid-answers zabawny_odp powazny_odp))))



;;;pyt25
(defrule luski ""

(logical 
   (or
      (poczucie_humoru zabawny_odp)
      (inteligencja funny_odp)
   ))

=>

   (assert (UI-state (display luski_pyt)
                     (relation-asserted luski)
                     (response tak_odp)
                     (valid-answers tak_odp nie_odp))))



;;;pyt26
(defrule moc ""

(logical (poczucie_humoru powazny_odp))

=>

   (assert (UI-state (display moc_pyt)
                     (relation-asserted moc)
                     (response sila_odp)
                     (valid-answers sila_odp intelekt_odp))))



;;;pyt27
(defrule plan_ataku ""

(logical (moc sila_odp))

=>

   (assert (UI-state (display plan_ataku_pyt)
                     (relation-asserted plan_ataku)
                     (response zaskoczenie_odp)
                     (valid-answers zaskoczenie_odp konfrontacja_odp))))



;;;pyt28
(defrule taktyka ""

(logical (moc intelekt_odp))

=>

   (assert (UI-state (display taktyka_pyt)
                     (relation-asserted taktyka)
                     (response podstep_odp)
                     (valid-answers podstep_odp taktyczne_odp))))



;;;pyt29
(defrule rozmiar_potwora ""

(logical (potwor1 full_odp))

=>

   (assert (UI-state (display rozmiar_potwora_pyt)
                     (relation-asserted rozmiar_potwora)
                     (response maly_odp)
                     (valid-answers maly_odp duzy_odp))))



;;;pyt30
(defrule zwierze ""

(logical 
   (or
      (hybryda tak_odp)
      (wyglad1 zwierze_odp)
   ))

=>

   (assert (UI-state (display zwierze_pyt)
                     (relation-asserted zwierze)
                     (response kon_odp)
                     (valid-answers kon_odp orzel_odp kruk_odp kot_odp krowa_odp slon_odp gad_odp inne_odp))))



;;;pyt31
(defrule jaki_gad ""

(logical 
   (or
      (cechy2 gad_bez_emocji_odp)
      (zwierze gad_odp)
   ))

=>

   (assert (UI-state (display jaki_gad_pyt)
                     (relation-asserted jaki_gad)
                     (response o_smoku_odp)
                     (valid-answers o_smoku_odp o_wezu_odp nie_wiem_odp))))



;;;pyt32
(defrule ork ""

(logical 
   (or
      (plan_ataku konfrontacja_odp)
      (rozmiar_potwora duzy_odp)
   ))

=>

   (assert (UI-state (display ork_pyt)
                     (relation-asserted ork)
                     (response ok_odp)
                     (valid-answers ok_odp bardziej_bohaterski_odp))))



;;;pyt33
(defrule hybryda ""

(logical (wyroznia2 original_odp))

=>

   (assert (UI-state (display hybryda_pyt)
                     (relation-asserted hybryda)
                     (response tak_odp)
                     (valid-answers tak_odp nie_odp))))



;;;pyt34
(defrule dziwna ""

(logical (hybryda nie_odp))

=>

   (assert (UI-state (display dziwna_pyt)
                     (relation-asserted dziwna)
                     (response tak_odp)
                     (valid-answers tak_odp nie_odp))))



;;;pyt35
(defrule dzin ""

(logical (dziwna tak_odp))

=>

   (assert (UI-state (display dzin_pyt)
                     (relation-asserted dzin)
                     (response tak_odp)
                     (valid-answers tak_odp nie_odp))))



;;;pyt36
(defrule gith ""

(logical (dzin nie_odp))

=>

   (assert (UI-state (display gith_pyt)
                     (relation-asserted gith)
                     (response tak_odp)
                     (valid-answers tak_odp nie_odp))))



;;;pyt37
(defrule gith_cecha ""

(logical (gith_specjalnosc specjalnosc_odp))

=>

   (assert (UI-state (display gith_cecha_pyt)
                     (relation-asserted gith_cecha)
                     (response wole_sile_odp)
                     (valid-answers wole_sile_odp wole_umysl_odp))))



;;;pyt38
(defrule vedalken ""

(logical (gith nie_odp))

=>

   (assert (UI-state (display vedalken_pyt)
                     (relation-asserted vedalken)
                     (response tak_odp)
                     (valid-answers tak_odp nie_odp))))



;;;pyt39
(defrule eksperyment ""

(logical (vedalken nie_odp))

=>

   (assert (UI-state (display eksperyment_pyt)
                     (relation-asserted eksperyment)
                     (response tak_odp)
                     (valid-answers tak_odp nie_odp))))



;;;pyt40
(defrule zywiol ""

(logical (dzin_zywiol zywiol_odp))

=>

   (assert (UI-state (display zywiol_pyt)
                     (relation-asserted zywiol)
                     (response ogien_odp)
                     (valid-answers ogien_odp ziemia_odp powietrze_odp woda_odp))))



;;;pyt41
(defrule niziolek ""

(logical (inteligencja stupid_odp))

=>

   (assert (UI-state (display niziolek_pyt)
                     (relation-asserted niziolek)
                     (response tak_odp)
                     (valid-answers tak_odp nie_odp))))



;;;pyt42
(defrule gnom ""

(logical (inteligencja very_stupid_odp))

=>

   (assert (UI-state (display gnom_pyt)
                     (relation-asserted gnom)
                     (response tak_odp)
                     (valid-answers tak_odp nie_odp))))



;;;pyt43
(defrule gorski_gnom ""

(logical (zamieszkanie gory_odp))

=>

   (assert (UI-state (display gorski_gnom_pyt)
                     (relation-asserted gorski_gnom)
                     (response tak_odp)
                     (valid-answers tak_odp nie_odp))))



;;;pyt44
(defrule elf_rule ""

(logical (wyglad2 smukly_odp))

=>

   (assert (UI-state (display elf_pyt)
                     (relation-asserted elf_rule)
                     (response tak_odp)
                     (valid-answers tak_odp nie_odp))))



;;;pyt45
(defrule czlowiek ""

(logical (wyroznia1 charakter_odp))

=>

   (assert (UI-state (display czlowiek_pyt)
                     (relation-asserted czlowiek)
                     (response ok_odp)
                     (valid-answers ok_odp nuda_odp))))



;;;pyt46
(defrule dark_elf ""

(logical 
   (or
      (elf_cechy mroczny_odp)
      (cechy1 gibki_odp)
   ))

=>

   (assert (UI-state (display dark_elf_pyt)
                     (relation-asserted dark_elf)
                     (response ok_odp)
                     (valid-answers ok_odp more_dark_odp))))



;;;pyt47
(defrule krasnolud ""

(logical (wyglad2 niski_odp))

=>

   (assert (UI-state (display krasnolud_pyt)
                     (relation-asserted krasnolud)
                     (response ok_odp)
                     (valid-answers ok_odp dokladniej_odp nie_niski_odp))))



;;;pyt48
(defrule aasimar ""

(logical (wyglad1 aniol_odp))

=>

   (assert (UI-state (display aasimar_pyt)
                     (relation-asserted aasimar)
                     (response tak_odp)
                     (valid-answers tak_odp nie_odp))))



;;;pyt49
(defrule triton ""

(logical (wyglad1 podwodne_odp))

=>

   (assert (UI-state (display triton_pyt)
                     (relation-asserted triton)
                     (response ok_odp)
                     (valid-answers ok_odp more_elf_odp))))



;;;pyt50
(defrule dzin_zywiol ""

(logical (dzin tak_odp))

=>

   (assert (UI-state (display dzin_zywiol_pyt)
                     (relation-asserted dzin_zywiol)
                     (response ok_odp)
                     (valid-answers ok_odp zywiol_odp))))



;;;pyt51
(defrule gith_specjalnosc ""

(logical (gith tak_odp))

=>

   (assert (UI-state (display gith_specjalnosc_pyt)
                     (relation-asserted gith_specjalnosc)
                     (response ok_odp)
                     (valid-answers ok_odp specjalnosc_odp))))





;;;****************
;;;* REPAIR RULES *
;;;****************

(defrule human_result ""

   (logical (wyroznia1 charakter_odp)
            (czlowiek ok_odp))
   
   =>

   (assert (UI-state (display human)
                     (state final))))



(defrule halfling_result ""

(logical (niziolek nie_odp)
         (inteligencja stupid_odp))

=>

(assert (UI-state (display halfling)
                  (state final))))



(defrule stout_result ""

(logical (niziolek tak_odp)
         (zwinnosc wytrzymaly_odp))

=>

(assert (UI-state (display stout)
                  (state final))))



(defrule lightfoot_result ""

(logical (niziolek tak_odp)
         (zwinnosc zwinny_odp))

=>

(assert (UI-state (display lightfoot)
                  (state final))))



(defrule gnome_result ""

(logical (gnom nie_odp)
         (inteligencja very_stupid_odp))

=>

(assert (UI-state (display gnome)
                  (state final))))



(defrule forest_gnome_result ""

(logical (gnom tak_odp)
         (zamieszkanie las_odp))

=>

(assert (UI-state (display forest_gnome)
                  (state final))))
                  


(defrule mountain_gnome_result ""

(logical (gnom tak_odp)
         (zamieszkanie gory_odp))

=>

(assert (UI-state (display mountain_gnome)
                  (state final))))



(defrule deep_gnome_result ""

(logical (gnom tak_odp)
         (zamieszkanie gory_odp)
         (gorski_gnom tak_odp))

=>

(assert (UI-state (display deep_gnome)
                  (state final))))



(defrule elf_result ""

(logical (wyglad2 smukly_odp)
         (elf_rule nie_odp))

=>

(assert (UI-state (display elf)
                  (state final))))


;
(defrule high_elf_result ""

(logical (elf_rule tak_odp)
         (wartosci magia_odp))

=>

(assert (UI-state (display high_elf)
                  (state final))))



(defrule wood_elf_result ""

(logical (elf_rule tak_odp)
         (wartosci natura_odp))

=>

(assert (UI-state (display wood_elf)
                  (state final))))



(defrule half_elf_result ""

(logical
      (or
         (elf_cechy w_polowie_elf_odp)
         (polowa basniowy_odp)
      ))

=>

(assert (UI-state (display half_elf)
                  (state final))))



(defrule eladrin_result ""

(logical (elf_rule tak_odp)
         (wartosci inne_odp)
         (elf_cechy bardziej_basniowy_odp))

=>

(assert (UI-state (display eladrin)
                  (state final))))



(defrule sea_elf_result ""

(logical
      (or
         (elf_cechy syrenka_odp)
         (triton more_elf_odp)
      ))

=>

(assert (UI-state (display sea_elf)
                  (state final))))



(defrule drow_result ""

(logical (dark_elf ok_odp))

=>

(assert (UI-state (display drow)
                  (state final))))



(defrule shadar_kai_result ""

(logical (dark_elf more_dark_odp))

=>

(assert (UI-state (display shadar_kai)
                  (state final))))



(defrule dwarf_result ""

(logical (wyglad2 niski_odp)
         (krasnolud ok_odp))

=>

(assert (UI-state (display dwarf)
                  (state final))))



(defrule hill_dwarf_result ""

(logical (krasnolud dokladniej_odp)
         (krasnolud_cechy wytrzymaly_kras_odp))

=>

(assert (UI-state (display hill_dwarf)
                  (state final))))



(defrule mountain_dwarf_result ""

(logical (krasnolud dokladniej_odp)
         (krasnolud_cechy silny_odp))

=>

(assert (UI-state (display mountain_dwarf)
                  (state final))))



(defrule duegar_result ""

(logical 
	(or 
		(and 
			(krasnolud dokladniej_odp)
         	(krasnolud_cechy mroczny_kras_odp)
         )
         (cechy1 niemily_odp)
    ))

=>

(assert (UI-state (display duegar)
                  (state final))))



(defrule firbolg_result ""

(logical (lagodny lagodny_odp))

=>

(assert (UI-state (display firbolg)
                  (state final))))



(defrule goliath_result ""

(logical 
   (or
         (lagodny sila_fizyczna_odp)
         (krasnolud nie_niski_odp)
   ))

=>

(assert (UI-state (display goliath)
                  (state final))))



(defrule orc_result ""

(logical (ork ok_odp))

=>

(assert (UI-state (display orc)
                  (state final))))



(defrule half_orc_result ""

(logical
   (or
         (ork bardziej_bohaterski_odp)
         (cechy2 half_monster_odp)
         (polowa potworny_odp)
         (potwor1 part_odp)
   ))

=>

(assert (UI-state (display half_orc)
                  (state final))))



(defrule tiefling_result ""

(logical (cechy2 rogi_odp))

=>

(assert (UI-state (display tiefling)
                  (state final))))



(defrule lizardfolk_result ""

(logical (jaki_gad nie_wiem_odp))

=>

(assert (UI-state (display lizardfolk)
                  (state final))))



(defrule dragonborn_result ""

(logical
   (or
      (and
         (rozmiar2 duzy_odp)
         (wyroznia2 smok_odp)
      )
      (and
         (jaki_gad o_smoku_odp)
         (rozmiar2 duzy_odp)
      )
   )
)

=>

(assert (UI-state (display dragonborn)
                  (state final))))



(defrule kobold_result ""

(logical
   (or
      (and
         (rozmiar2 maly_odp)
         (wyroznia2 smok_odp)
      )
      (and
         (jaki_gad o_smoku_odp)
         (rozmiar2 maly_odp)
      )
      (luski tak_odp)
   )
)

=>

(assert (UI-state (display kobold)
                  (state final))))



(defrule yuan_ti_result ""

(logical
   (or
      (jaki_gad o_wezu_odp)
      (taktyka podstep_odp)
   )
)

=>

(assert (UI-state (display yuan_ti)
                  (state final))))



(defrule bugbear_result ""

(logical (plan_ataku zaskoczenie_odp))

=>

(assert (UI-state (display bugbear)
                  (state final))))



(defrule goblin_result ""

(logical
   (or
      (luski nie_odp)
      (and
         (wyglad1 potwor_odp)
         (rozmiar_potwora maly_odp)
      )
   )
)

=>

(assert (UI-state (display goblin)
                  (state final))))



(defrule hobgoblin_result ""

(logical (taktyka taktyczne_odp))

=>

(assert (UI-state (display hobgoblin)
                  (state final))))



(defrule aasimar_result ""

(logical (aasimar nie_odp))

=>

(assert (UI-state (display aasimar)
                  (state final))))



(defrule protector_result ""

(logical (aniol dobry_odp))

=>

(assert (UI-state (display protector)
                  (state final))))



(defrule scourge_result ""

(logical (aniol pyszny_odp))

=>

(assert (UI-state (display scourge)
                  (state final))))



(defrule fallen_result ""

(logical 
   (or
      (aniol upadly_odp)
      (cechy1 saint_odp)   
   ))

=>

(assert (UI-state (display fallen)
                  (state final))))



(defrule triton_result ""

(logical (wyglad1 podwodne_odp)
         (triton ok_odp))

=>

(assert (UI-state (display triton)
                  (state final))))



(defrule warforged_result ""

(logical (wyglad1 robot_odp))

=>

(assert (UI-state (display warforged)
                  (state final))))



(defrule changelings_result ""

(logical (wyglad1 sobowtor_odp))

=>

(assert (UI-state (display changelings)
                  (state final))))



(defrule centaur_result ""

(logical (zwierze kon_odp))

=>

(assert (UI-state (display centaur)
                  (state final))))



(defrule aarakocra_result ""

(logical (zwierze orzel_odp))

=>

(assert (UI-state (display aarakocra)
                  (state final))))



(defrule kenku_result ""

(logical (zwierze kruk_odp))

=>

(assert (UI-state (display kenku)
                  (state final))))



(defrule tabaxi_result ""

(logical (zwierze kot_odp))

=>

(assert (UI-state (display tabaxi)
                  (state final))))



(defrule minotaur_result ""

(logical (zwierze krowa_odp))

=>

(assert (UI-state (display minotaur)
                  (state final))))



(defrule loxadon_result ""

(logical (zwierze slon_odp))

=>

(assert (UI-state (display loxadon)
                  (state final))))



(defrule shifter_result ""

(logical (zwierze inne_odp))

=>

(assert (UI-state (display shifter)
                  (state final))))



(defrule genasi_result ""

(logical (dzin tak_odp)
         (dzin_zywiol ok_odp))

=>

(assert (UI-state (display genasi)
                  (state final))))



(defrule fire_genasi_result ""

(logical (dzin_zywiol zywiol_odp)
         (zywiol ogien_odp))

=>

(assert (UI-state (display fire_genasi)
                  (state final))))



(defrule earth_genasi_result ""

(logical (dzin_zywiol zywiol_odp)
         (zywiol ziemia_odp))

=>

(assert (UI-state (display earth_genasi)
                  (state final))))



(defrule air_genasi_result ""

(logical (dzin_zywiol zywiol_odp)
         (zywiol powietrze_odp))

=>

(assert (UI-state (display air_genasi)
                  (state final))))



(defrule water_genasi_result ""

(logical (dzin_zywiol zywiol_odp)
         (zywiol woda_odp))

=>

(assert (UI-state (display water_genasi)
                  (state final))))



(defrule gith_result ""

(logical (gith_specjalnosc ok_odp)
         (gith tak_odp))

=>

(assert (UI-state (display gith)
                  (state final))))



(defrule githyanki_result ""

(logical (gith_specjalnosc specjalnosc_odp)
         (gith_cecha wole_sile_odp))

=>

(assert (UI-state (display githyanki)
                  (state final))))



(defrule githzerai_result ""

(logical (gith_specjalnosc specjalnosc_odp)
         (gith_cecha wole_umysl_odp))

=>

(assert (UI-state (display githzerai)
                  (state final))))



(defrule vedalken_result ""

(logical (vedalken tak_odp))

=>

(assert (UI-state (display vedalken)
                  (state final))))

                  

(defrule simic_hybrid_result ""

(logical (eksperyment tak_odp))

=>

(assert (UI-state (display simic_hybrid)
                  (state final))))



(defrule kalashtar_result ""

(logical (eksperyment nie_odp))

=>

(assert (UI-state (display kalashtar)
                  (state final))))




                     
;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   
