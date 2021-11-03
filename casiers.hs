import qualified Data.Map as Map

data StatutOccupation = Pris | Disponible deriving (Show, Eq)
type Code = String
type CasierMap = Map.Map Int (StatutOccupation, Code)

casierRecup :: Int -> CasierMap -> Either String Code
casierRecup numeroCasier map = 
    case Map.lookup numeroCasier map of
      Nothing -> Left $ "Absence du casier" ++ show numeroCasier
      Just (etat, code) -> if etat /= Pris then Right code else Left  "Ce casier est deja pris!"

casiers :: CasierMap
casiers = Map.fromList
    [(100,(Pris,"ZD39I"))
    ,(101,(Disponible,"JAH3I"))
    ,(103,(Disponible,"IQSA9"))
    ,(105,(Disponible,"QOTSA"))
    ,(109,(Pris,"893JJ"))
    ,(110,(Pris,"99292"))
    ]


main = do
    print $ casierRecup 100 casiers
    print $ casierRecup 101 casiers
    print $ casierRecup 1010 casiers
