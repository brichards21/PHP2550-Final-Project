# figure plot code 




# plot important variables

# SALMONELLA
# tetracycline
salm_tet_g <- ggplot(data = salm_imp_tet,
                     aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                         fill = var
                     )) + 
  geom_col( col = "black") +
  labs(x = "", y = "Gini Importance", fill = "",
       title = "Source and Genetic Predictors",
       subtitle = "(a) Tetracycline") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  theme(plot.title = element_text(hjust = 0.5, size = 12)) +
  scale_fill_manual(values = c("lightgreen", "goldenrod2",
                               "darksalmon", "lightseagreen", 
                               "lightskyblue")) 

salm_tet_g_s <- ggplot(data = salm_imp_tet_nogene,
                       aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                           fill = var
                       )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = "",
       title = "Source Predictors Only") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  theme(plot.title = element_text(hjust = 0.5, size = 12)) +
  scale_fill_manual(values = c("violet", "deeppink",
                               "mintcream", "cornsilk3", 
                               "orangered3")) 


# strep
salm_strep_g <- ggplot(data = salm_imp_strep,
                       aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                           fill = var
                       )) + 
  geom_col( col = "black") +
  labs(x = "",  fill = "", y = "",
       subtitle = "(b) Streptomycin") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  scale_fill_manual(values = c("darkcyan", "beige",
                               "cadetblue2", "darkolivegreen1", 
                               "darksalmon")) 


salm_strep_g_s <- ggplot(data = salm_imp_strep_nogene,
                         aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                             fill = var
                         )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = ""
  ) +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  scale_fill_manual(values = c("violet", "deeppink",
                               "mintcream", "cornsilk3", 
                               "orangered3"))



# sulfisoxazole

salm_sulf_g <- ggplot(data = salm_imp_sulf,
                      aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                          fill = var
                      )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = "",
       subtitle = "(c) Sulfisoxazole") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  theme(plot.title = element_text(hjust = 0.5, size = 19)) +
  scale_fill_manual(values = c("darkcyan", "darkolivegreen1",
                               "goldenrod2", "darksalmon", 
                               "lightseagreen")) 

salm_sulf_g_s <- ggplot(data = salm_imp_sulf_nogene,
                        aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                            fill = var
                        )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = "") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  scale_fill_manual(values = c("violet", "deeppink",
                               "mintcream", "cornsilk3", 
                               "orangered3"))

# ampicillin

salm_amp_g <- ggplot(data = salm_imp_amp,
                     aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                         fill = var
                     )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = "",
       subtitle = "(d) Ampicillin") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  scale_fill_manual(values = c("turquoise4", "lemonchiffon",
                               "navy", "brown", 
                               "darksalmon")) 


salm_amp_g_s <- ggplot(data = salm_imp_amp_nogene,
                       aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                           fill = var
                       )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = ""
  ) +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  scale_fill_manual(values = c("violet", "deeppink",
                               "mintcream", "cornsilk3", 
                               "orangered3"))








# plot important variables

# ECOLI
# tetracycline
ecoli_tet_g <- ggplot(data = ecoli_imp_tet,
                      aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                          fill = var
                      )) + 
  geom_col( col = "black") +
  labs(x = "", y = "Gini Importance", fill = "",
       title = "Source and Genetic Predictors",
       subtitle = "(a) Tetracycline") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  theme(plot.title = element_text(hjust = 0.5, size = 12)) +
  scale_fill_manual(values = c("beige", "cadetblue2",
                               "mintcream", "goldenrod2", 
                               "lightseagreen")) 


ecoli_tet_g_s <- ggplot(data = ecoli_imp_tet_nogene,
                        aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                            fill = var
                        )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = "",
       title = "Source Predictors Only") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  theme(plot.title = element_text(hjust = 0.5, size = 12)) +
  scale_fill_manual(values = c("violet", "deeppink",
                               "mintcream", "cornsilk3" 
  )) 


# cip
ecoli_cip_g <- ggplot(data = ecoli_imp_cip,
                      aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                          fill = var
                      )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = "",
       subtitle = "(b) Ciprofloxacin") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  scale_fill_manual(values = c("violet", "mintcream",
                               "cornsilk3", "chartreuse", 
                               "darksalmon")) 


ecoli_cip_g_s <- ggplot(data = ecoli_imp_cip_nogene,
                        aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                            fill = var
                        )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = ""
  ) +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  scale_fill_manual(values = c("violet", "deeppink",
                               "mintcream", "cornsilk3"))



# meropenem

ecoli_mero_g <- ggplot(data = ecoli_imp_mero,
                       aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                           fill = var
                       )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = "",
       subtitle = "(c) Meropenem") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  theme(plot.title = element_text(hjust = 0.5, size = 19)) +
  scale_fill_manual(values = c("violet", "deeppink",
                               "brown", "chartreuse", 
                               "darksalmon")) 


ecoli_mero_g_s <- ggplot(data = ecoli_imp_mero_nogene,
                         aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                             fill = var
                         )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = "") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  scale_fill_manual(values = c("violet", "deeppink",
                               "mintcream", "cornsilk3"))

# ampicillin

ecoli_amp_g <- ggplot(data = ecoli_imp_amp,
                      aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                          fill = var
                      )) + 
  geom_col( col = "black") +
  labs(x = "",  fill = "", y = "",
       subtitle = "(d) Ampicillin") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  scale_fill_manual(values = c("mintcream", "cornsilk3",
                               "brown", "chartreuse", 
                               "darksalmon")) 


ecoli_amp_g_s <- ggplot(data = ecoli_imp_amp_nogene,
                        aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                            fill = var
                        )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = ""
  ) +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  scale_fill_manual(values = c("violet", "deeppink",
                               "mintcream", "cornsilk3"))








# plot important variables

# CAMPY
# tetracycline
campy_tet_g <- ggplot(data = campy_imp_tet,
                      aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                          fill = var
                      )) + 
  geom_col( col = "black") +
  labs(x = "", y = "Gini Importance", fill = "",
       title = "Source and Genetic Predictors",
       subtitle = "(a) Tetracycline") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  theme(plot.title = element_text(hjust = 0.5, size = 12)) +
  scale_fill_manual(values = c("darkslateblue", "violet",
                               "mintcream", "darksalmon", 
                               "gray")) 


campy_tet_g_s <- ggplot(data = campy_imp_tet_nogene,
                        aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                            fill = var
                        )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = "",
       title = "Source Predictors Only") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  theme(plot.title = element_text(hjust = 0.5, size = 12)) +
  scale_fill_manual(values = c("violet", "deeppink",
                               "mintcream", "cornsilk3" 
  )) 


# cip
campy_cip_g <- ggplot(data = campy_imp_cip,
                      aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                          fill = var
                      )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = "",
       subtitle = "(b) Ciprofloxacin") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  scale_fill_manual(values = c("sienna2", "chartreuse",
                               "ivory", "darksalmon", 
                               "gray")) 


campy_cip_g_s <- ggplot(data = campy_imp_cip_nogene,
                        aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                            fill = var
                        )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = ""
  ) +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  scale_fill_manual(values = c("violet", "deeppink",
                               "mintcream", "cornsilk3"))



# gentamicin

campy_gent_g <- ggplot(data = campy_imp_gent,
                       aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                           fill = var
                       )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = "",
       subtitle = "(c) Gentamicin") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  theme(plot.title = element_text(hjust = 0.5, size = 19)) +
  scale_fill_manual(values = c("mintcream", "brown",
                               "chartreuse", "ivory", 
                               "darksalmon")) 


campy_gent_g_s <- ggplot(data = campy_imp_gent_nogene,
                         aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                             fill = var
                         )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = "") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  scale_fill_manual(values = c("violet", "deeppink",
                               "mintcream", "cornsilk3"))

# erythromycin

campy_ery_g <- ggplot(data = campy_imp_ery,
                      aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                          fill = var
                      )) + 
  geom_col( col = "black") +
  labs(x = "",  fill = "", y = "",
       subtitle = "(d) Erythromycin") +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  scale_fill_manual(values = c("mintcream", "brown",
                               "chartreuse", "ivory", 
                               "darksalmon")) 


campy_ery_g_s <- ggplot(data = campy_imp_ery_nogene,
                        aes(x = fct_rev(fct_reorder(var, gini_importance)), y = gini_importance,
                            fill = var
                        )) + 
  geom_col( col = "black") +
  labs(x = "", fill = "", y = ""
  ) +
  theme_bw()+ theme(axis.text.x = element_text(angle = 45,
                                               vjust = 0.5,
                                               size = 7),
                    plot.title = element_text(size = 10),
                    legend.position = "none"
  ) +
  scale_fill_manual(values = c("violet", "deeppink",
                               "mintcream", "cornsilk3"))




