/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MiniSql;

import AnalizadorLexico.*;
import AnalizadorSintactico.AnalizadorSintactico;
import AnalizadorSintactico.Ascendente.parser;
import java.awt.Color;
import java.util.List;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.text.BadLocationException;
import javax.swing.text.DefaultStyledDocument;
import javax.swing.text.Style;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyleContext;

/**
 *
 * @author axel
 */
public class Principal extends javax.swing.JFrame {

    /**
     * Creates new form Principal
     */
    public Principal() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        txtPrueba = new javax.swing.JTextField();
        btnSeleccionar = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        txtCodigo = new javax.swing.JTextPane();
        jScrollPane2 = new javax.swing.JScrollPane();
        txtMensajes = new javax.swing.JTextPane();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setText("Seleccionar archivo");

        txtPrueba.setEditable(false);

        btnSeleccionar.setText("Seleccionar Archivo");
        btnSeleccionar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSeleccionarActionPerformed(evt);
            }
        });

        txtCodigo.setEditable(false);
        jScrollPane1.setViewportView(txtCodigo);

        txtMensajes.setEditable(false);
        jScrollPane2.setViewportView(txtMensajes);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(txtPrueba, javax.swing.GroupLayout.DEFAULT_SIZE, 1147, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnSeleccionar))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addComponent(jScrollPane2))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtPrueba, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnSeleccionar))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 512, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 199, Short.MAX_VALUE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnSeleccionarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSeleccionarActionPerformed
        // TODO add your handling code here:
        try {
            // Lee el archivo de entrada
            JFileChooser chooser = new JFileChooser();
            chooser.setMultiSelectionEnabled(false);
            if (chooser.showOpenDialog(this) == JFileChooser.APPROVE_OPTION) {
                
                // Obtiene el archivo seleccionado
                txtCodigo.setText("");
                txtMensajes.setText("");
                Errores.Errores = new StringBuilder();
                File archivoSeleccionado = chooser.getSelectedFile();
                txtPrueba.setText(archivoSeleccionado.getAbsolutePath());
                String ubicacion = archivoSeleccionado.getParent();
                BufferedReader buffered = new BufferedReader(new FileReader(archivoSeleccionado));
                //Lexemas analizadorFlex = new Lexemas(buffered);
                String erroresLexicos = "";
                MiniSql.ubicacionArchivo = archivoSeleccionado;
                parser pr = new parser();
                pr.parse();
                txtMensajes.setText(txtMensajes.getText() + "\n" + "\n" + Errores.Errores.toString());
                /*List<MyToken> datos = analizadorFlex.yylex();
                boolean existeError = false;
                for (int i = 0; i < datos.size(); i++) {
                    if (datos.get(i).get_type().equals("Error")) {
                        existeError = true;
                        erroresLexicos += datos.get(i).toString() + "\n";
                    }
                }
                txtMensajes.setText(erroresLexicos);
                AnalizadorSintactico analizadorSin = null;
                                
                StyleContext sc = new StyleContext();
                final DefaultStyledDocument doc = new DefaultStyledDocument(sc);
                
                final Style blueStyle = sc.addStyle("BLUE", null);
                blueStyle.addAttribute(StyleConstants.Foreground, Color.blue);
                
                final Style redStyle = sc.addStyle("RED", null);
                redStyle.addAttribute(StyleConstants.Foreground, Color.red);
                
                final Style defaultStyle = sc.addStyle("BLACK", null);
                defaultStyle.addAttribute(StyleConstants.Foreground, Color.black);
                
                final Style greenStyle = sc.addStyle("GREEN", null);
                greenStyle.addAttribute(StyleConstants.Foreground, Color.green);
                
                txtCodigo.setStyledDocument(doc);
                Style estiloUsado = null;
                for (int i = 0; i < datos.size(); i++) {
                    switch (datos.get(i).get_type()) {
                        case "Error":
                            estiloUsado = redStyle;
                            break;
                        case "Reservada":
                            estiloUsado = blueStyle;
                            break;
                        case "Comentario":
                            estiloUsado = greenStyle;
                            break;
                        default:
                            estiloUsado = defaultStyle;
                            break;
                    }
                    doc.insertString(txtCodigo.getText().length(), datos.get(i).get_lexema(), estiloUsado);
                }
                analizadorSin = new AnalizadorSintactico(datos);
                txtMensajes.setText(txtMensajes.getText() + "\n" + "\n" + Errores.Errores.toString());*/
                
            }
        } catch (IOException ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        }/* catch (BadLocationException ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        }*/
    }//GEN-LAST:event_btnSeleccionarActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Principal().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnSeleccionar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTextPane txtCodigo;
    private javax.swing.JTextPane txtMensajes;
    private javax.swing.JTextField txtPrueba;
    // End of variables declaration//GEN-END:variables
}
