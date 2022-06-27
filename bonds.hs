trouveBonds= trouve 0

-- Calcul le nombre de bonds
trouve bonds m | m >= 96  = trouve (bonds+24) (m-96)
			   | m >= 8   = trouve (bonds+2)  (m-8)
			   | otherwise= bonds
