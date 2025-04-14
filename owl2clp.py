from rdflib import Graph, RDF, RDFS, OWL, Namespace, URIRef

import os

def convert_owl_to_clp(owl_file_path, output_dir):

    g = Graph()
    g.parse(owl_file_path)

    # Define common namespaces
    OWL_NS = OWL
    RDF_NS = RDF
    RDFS_NS = RDFS

    # Custom or default namespace
    ont_ns = None
    for ns in g.namespaces():
        if 'ontology' in ns[0].lower() or 'base' in ns[0].lower():
            ont_ns = Namespace(ns[1])
            break

    if ont_ns is None:
        ont_ns = list(g.namespaces())[0][1]

    # Output files
    templates_path = os.path.join(output_dir, "templates.clp")
    rules_path = os.path.join(output_dir, "rules.clp")
    facts_path = os.path.join(output_dir, "facts.clp")

    with open(templates_path, "w") as tf, open(rules_path, "w") as rf, open(facts_path, "w") as ff:
        tf.write(";;; Generated Templates from OWL\n\n")
        rf.write(";;; Generated Rules from OWL\n\n")
        ff.write(";;; Generated Facts from OWL\n\n")

        # Process Classes
        for cls in g.subjects(RDF_NS.type, OWL_NS.Class):
            cls_name = cls.split('#')[-1] if '#' in cls else cls.split('/')[-1]
            tf.write(f"(deftemplate {cls_name}\n\t(slot name)\n)\n\n")

        # Process ObjectProperties
        for prop in g.subjects(RDF_NS.type, OWL_NS.ObjectProperty):
            prop_name = prop.split('#')[-1] if '#' in prop else prop.split('/')[-1]
            tf.write(f"; ObjectProperty: {prop_name}\n")

        # Process DataProperties
        for prop in g.subjects(RDF_NS.type, OWL_NS.DatatypeProperty):
            prop_name = prop.split('#')[-1] if '#' in prop else prop.split('/')[-1]
            tf.write(f"; DatatypeProperty: {prop_name}\n")

        # Process Subclass rules
        for subclass, _, superclass in g.triples((None, RDFS_NS.subClassOf, None)):
            sub_name = subclass.split('#')[-1] if '#' in subclass else subclass.split('/')[-1]
            super_name = superclass.split('#')[-1] if '#' in superclass else superclass.split('/')[-1]
            rf.write(f"(defrule infer-{sub_name}-is-{super_name}\n")
            rf.write(f"   (declare (auto-focus TRUE))\n")
            rf.write(f"   ({sub_name} (name ?x))\n")
            rf.write(f"   =>\n")
            rf.write(f"   (assert ({super_name} (name ?x)))\n")
            rf.write(f")\n\n")

        # Process Individuals (Facts)
        for individual in g.subjects(RDF_NS.type, None):
            for cls in g.objects(individual, RDF_NS.type):
                if isinstance(cls, URIRef) and (cls != RDF_NS.Property):
                    cls_name = cls.split('#')[-1] if '#' in cls else cls.split('/')[-1]
                    individual_name = individual.split('#')[-1] if '#' in individual else individual.split('/')[-1]
                    ff.write(f"(assert ({cls_name} (name {individual_name})))\n")

    print(f"Conversion complete. Files saved in: {output_dir}")



def main():
    # Especificamos la ruta del archivo OWL
    owl_file = "menu.owl"
    
    # Especificamos la carpeta de salida para los archivos CLP
    output_dir = "./clp"
    
    # Aseguramos que el directorio de salida exista
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    
    # Llamamos a la función para convertir el OWL a CLP
    convert_owl_to_clp(owl_file, output_dir)

if __name__ == "__main__":
    main()
