import { Modal, ModalProps } from "react-bootstrap";
import styles from "./styles.module.scss";

interface IProps {
  show: boolean;
  toggleShow: () => void;
  body?: React.ReactElement;
  footer?: React.ReactElement;
  otherProps?: ModalProps;
}

const TDLModal = ({ show, toggleShow, body, footer, otherProps }: IProps) => (
  <Modal
    show={show}
    size="lg"
    aria-labelledby="contained-modal-title-vcenter"
    centered
    onHide={toggleShow}
    {...otherProps}
  >
    <Modal.Header closeButton className={`${styles.modalHeader}`}>
      <Modal.Title
        id="contained-modal-title-vcenter"
        className={`${styles.modalTitle}`}
      >
        Modal heading
      </Modal.Title>
    </Modal.Header>
    {body && <Modal.Body className={`${styles.modalBody}`}>{body}</Modal.Body>}
    {footer && (
      <Modal.Footer className={`${styles.modalFooter}`}>{footer}</Modal.Footer>
    )}
  </Modal>
);

export default TDLModal;
