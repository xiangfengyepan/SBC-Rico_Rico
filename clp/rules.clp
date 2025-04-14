;;; Generated Rules from OWL

(defrule infer-PrimerPlato-is-Plato
   (declare (auto-focus TRUE))
   (PrimerPlato (name ?x))
   =>
   (assert (Plato (name ?x)))
)

(defrule infer-SegundoPlato-is-Plato
   (declare (auto-focus TRUE))
   (SegundoPlato (name ?x))
   =>
   (assert (Plato (name ?x)))
)

(defrule infer-Postre-is-Plato
   (declare (auto-focus TRUE))
   (Postre (name ?x))
   =>
   (assert (Plato (name ?x)))
)

